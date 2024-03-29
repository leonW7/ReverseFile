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
L0_0("teamf1lualib/nat")
L0_0 = require
L0_0("teamf1lualib/igmp")
L0_0 = require
L0_0("teamf1lualib/nimf")
L0_0 = require
L0_0("teamf1lualib/ThreeGInternet")
L0_0 = {}
nimfView = L0_0
L0_0 = "WAN1"
logIfName = L0_0
L0_0 = "2"
addressFamily = L0_0
L0_0 = 1
pppoe6Table = "pppoe6"
vlanTable = "vlan"
;({}).pppoeSessions = "PppoeSessions"
;({}).vlanIPv6 = "vlanIPv6"
ENABLE = "1"
DISABLE = "0"
function nimfView.config(A0_1, A1_2, A2_3)
  local L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16
  L3_4 = ACCESS_LEVEL
  if L3_4 ~= 0 then
    L3_4 = "ACCESS_DENIED"
    L4_5 = "10187"
    return L3_4, L4_5
  end
  L3_4 = db
  L3_4 = L3_4.getRowWhere
  L4_5 = "NimfConf"
  L5_6 = "LogicalIfName = '"
  L6_7 = logIfName
  L7_8 = "' and AddressFamily = "
  L8_9 = addressFamily
  L5_6 = L5_6 .. L6_7 .. L7_8 .. L8_9
  L3_4 = L3_4(L4_5, L5_6)
  L4_5 = 1
  while L3_4 == nil and L4_5 <= 3 do
    L5_6 = db
    L5_6 = L5_6.getRowWhere
    L6_7 = "NimfConf"
    L7_8 = "LogicalIfName = '"
    L8_9 = logIfName
    L9_10 = "' and AddressFamily = "
    L10_11 = addressFamily
    L7_8 = L7_8 .. L8_9 .. L9_10 .. L10_11
    L5_6 = L5_6(L6_7, L7_8)
    L3_4 = L5_6
    L4_5 = L4_5 + 1
  end
  if L3_4 == nil then
    L5_6 = "ERROR"
    L6_7 = "10993"
    return L5_6, L6_7
  end
  A1_2 = L3_4["NimfConf._ROWID_"]
  L5_6 = false
  L6_7 = {}
  L7_8 = {}
  L8_9 = {}
  L9_10 = A0_1["Wan.vlanTagEnable"]
  if L9_10 == "1" then
    L6_7["NimfConf.vlanTagEnable"] = "1"
    L9_10 = tonumber
    L10_11 = A0_1["Wan.vlanId"]
    L9_10 = L9_10(L10_11)
    L6_7["NimfConf.vlanId"] = L9_10
  else
    L6_7["NimfConf.vlanTagEnable"] = "0"
  end
  L9_10 = logIfName
  L6_7["NimfConf.LogicalIfName"] = L9_10
  L9_10 = A0_1["Wan.IspLoginRequired"]
  L6_7["NimfConf.RequireLogin"] = L9_10
  L9_10 = A0_1["Wan.IspLoginRequired"]
  if L9_10 == "0" then
    L9_10 = A0_1["Wan.IsGetIpDyn"]
    if L9_10 == "1" then
      L6_7["NimfConf.ConnectionType"] = "dhcpc"
      L9_10 = logIfName
      L7_8["Dhcpc.LogicalIfName"] = L9_10
      L9_10 = A0_1["Wan.HostName"]
      L7_8["Dhcpc.HostName"] = L9_10
      L9_10 = A0_1["Wan.IsDNSDyn"]
      L7_8["Dhcpc.GetDnsFromIsp"] = L9_10
      L9_10 = A0_1["Wan.IsDNSDyn"]
      if L9_10 == "0" then
        L9_10 = util
        L9_10 = L9_10.joinFields
        L10_11 = A0_1
        L14_15 = 4
        L9_10 = L9_10(L10_11, L11_12, L12_13, L13_14, L14_15)
        L7_8["Dhcpc.PrimaryDns"] = L9_10
        L9_10 = util
        L9_10 = L9_10.joinFields
        L10_11 = A0_1
        L14_15 = 4
        L9_10 = L9_10(L10_11, L11_12, L12_13, L13_14, L14_15)
        L7_8["Dhcpc.SecondaryDns"] = L9_10
      end
      L9_10 = db
      L9_10 = L9_10.existsRowWhere
      L10_11 = "Dhcpc"
      L9_10 = L9_10(L10_11, L11_12)
      if L9_10 then
        L9_10 = dhcpc
        L9_10 = L9_10.config
        L10_11 = L7_8
        L14_15 = logIfName
        L15_16 = "_ROWID_"
        L9_10 = L9_10(L10_11, L11_12, L12_13)
        L5_6 = L9_10
      else
        L9_10 = dhcpc
        L9_10 = L9_10.config
        L10_11 = L7_8
        L9_10 = L9_10(L10_11, L11_12, L12_13)
        L5_6 = L9_10
      end
    else
      L6_7["NimfConf.ConnectionType"] = "ifStatic"
      L9_10 = logIfName
      L7_8["ifStatic.LogicalIfName"] = L9_10
      L9_10 = util
      L9_10 = L9_10.joinFields
      L10_11 = A0_1
      L14_15 = 4
      L9_10 = L9_10(L10_11, L11_12, L12_13, L13_14, L14_15)
      L7_8["ifStatic.StaticIp"] = L9_10
      L9_10 = util
      L9_10 = L9_10.joinFields
      L10_11 = A0_1
      L14_15 = 4
      L9_10 = L9_10(L10_11, L11_12, L12_13, L13_14, L14_15)
      L7_8["ifStatic.NetMask"] = L9_10
      L9_10 = util
      L9_10 = L9_10.joinFields
      L10_11 = A0_1
      L14_15 = 4
      L9_10 = L9_10(L10_11, L11_12, L12_13, L13_14, L14_15)
      L7_8["ifStatic.Gateway"] = L9_10
      L9_10 = util
      L9_10 = L9_10.joinFields
      L10_11 = A0_1
      L14_15 = 4
      L9_10 = L9_10(L10_11, L11_12, L12_13, L13_14, L14_15)
      L7_8["ifStatic.PrimaryDns"] = L9_10
      L9_10 = util
      L9_10 = L9_10.joinFields
      L10_11 = A0_1
      L14_15 = 4
      L9_10 = L9_10(L10_11, L11_12, L12_13, L13_14, L14_15)
      L7_8["ifStatic.SecondaryDns"] = L9_10
      L7_8["ifStatic.AddressFamily"] = "2"
      L9_10 = db
      L9_10 = L9_10.existsRowWhere
      L10_11 = "ifStatic"
      L14_15 = addressFamily
      L9_10 = L9_10(L10_11, L11_12)
      if L9_10 then
        L9_10 = ifStatic
        L9_10 = L9_10.config
        L10_11 = L7_8
        L14_15 = logIfName
        L15_16 = "_ROWID_"
        L9_10 = L9_10(L10_11, L11_12, L12_13)
        L5_6 = L9_10
      else
        L9_10 = ifStatic
        L9_10 = L9_10.config
        L10_11 = L7_8
        L9_10 = L9_10(L10_11, L11_12, L12_13)
        L5_6 = L9_10
      end
    end
  else
    L9_10 = A0_1["Wan.IspType"]
    if L9_10 == "1" then
      L9_10 = db
      L9_10 = L9_10.getRowsWhere
      L10_11 = "PppoeProfile"
      L9_10 = L9_10(L10_11, L11_12)
      L6_7["NimfConf.ConnectionType"] = "pppoe"
      L10_11 = logIfName
      L7_8["PppoeProfile.LogicalIfName"] = L10_11
      L7_8["PppoeProfile.ProfileName"] = "pppoeProfile1"
      L7_8["PppoeProfile.Status"] = "1"
      L10_11 = A0_1["Wan.AuthOpt"]
      L7_8["PppoeProfile.AuthOpt"] = L10_11
      L10_11 = A0_1["Wan.UserName"]
      L7_8["PppoeProfile.UserName"] = L10_11
      L10_11 = util
      L10_11 = L10_11.isAllMasked
      L10_11 = L10_11(L11_12)
      if L10_11 == false then
        L10_11 = A0_1["Wan.Password"]
        L7_8["PppoeProfile.Password"] = L10_11
      end
      L10_11 = A0_1["Wan.Service"]
      L7_8["PppoeProfile.Service"] = L10_11
      L10_11 = A0_1["Wan.PIsGetIpDyn"]
      L7_8["PppoeProfile.GetIpFromIsp"] = L10_11
      L10_11 = A0_1["Wan.IsDNSDyn"]
      L7_8["PppoeProfile.GetDnsFromIsp"] = L10_11
      L10_11 = A0_1["Wan.PIsGetIpDyn"]
      if L10_11 == "0" then
        L10_11 = A0_1["Wan.PIpAddr"]
        L7_8["PppoeProfile.StaticIp"] = L10_11
        L10_11 = A0_1["Wan.PSnetMask"]
        L7_8["PppoeProfile.NetMask"] = L10_11
      end
      L10_11 = A0_1["Wan.IsDNSDyn"]
      if L10_11 == "0" then
        L10_11 = A0_1["Wan.PriDnsIpAddr"]
        L7_8["PppoeProfile.PrimaryDns"] = L10_11
        L10_11 = A0_1["Wan.SecDnsIpAddr"]
        L7_8["PppoeProfile.SecondaryDns"] = L10_11
      end
      L10_11 = A0_1["Wan.PppoeIdleTimeOutFlag"]
      L7_8["PppoeProfile.IdleTimeOutFlag"] = L10_11
      L10_11 = A0_1["Wan.PppoeIdleTimeOutFlag"]
      if L10_11 == "1" then
        L10_11 = A0_1["Wan.PppoeIdleTimeOutValue"]
        L7_8["PppoeProfile.IdleTimeOutValue"] = L10_11
      end
      L10_11 = L9_10[1]
      if L10_11 ~= nil then
        L10_11 = L9_10[1]
        L10_11 = L10_11["PppoeProfile.ProfileName"]
        L7_8["PppoeProfile.ProfileName"] = L10_11
        L10_11 = pppoe
        L10_11 = L10_11.profileConfig
        L10_11 = L10_11(L11_12, L12_13, L13_14)
        L5_6 = L10_11
      else
        L10_11 = pppoe
        L10_11 = L10_11.profileConfig
        L10_11 = L10_11(L11_12, L12_13, L13_14)
        L5_6 = L10_11
      end
    else
      L9_10 = A0_1["Wan.IspType"]
      if L9_10 == "6" then
        L9_10 = db
        L9_10 = L9_10.getRowsWhere
        L10_11 = "PppoeProfile"
        L9_10 = L9_10(L10_11, L11_12)
        L6_7["NimfConf.ConnectionType"] = "pppoe"
        L10_11 = logIfName
        L7_8["PppoeProfile.LogicalIfName"] = L10_11
        L7_8["PppoeProfile.ProfileName"] = "pppoeProfile1"
        L7_8["PppoeProfile.Status"] = "1"
        L10_11 = A0_1["Wan.AuthOpt"]
        L7_8["PppoeProfile.AuthOpt"] = L10_11
        L10_11 = A0_1["Wan.UserName"]
        L7_8["PppoeProfile.UserName"] = L10_11
        L10_11 = util
        L10_11 = L10_11.isAllMasked
        L10_11 = L10_11(L11_12)
        if L10_11 == false then
          L10_11 = A0_1["Wan.Password"]
          L7_8["PppoeProfile.Password"] = L10_11
        end
        L10_11 = A0_1["Wan.Service"]
        L7_8["PppoeProfile.Service"] = L10_11
        L10_11 = A0_1["Wan.PIsGetIpDyn"]
        L7_8["PppoeProfile.GetIpFromIsp"] = L10_11
        L10_11 = A0_1["Wan.IsDNSDyn"]
        L7_8["PppoeProfile.GetDnsFromIsp"] = L10_11
        L10_11 = A0_1["Wan.PIsGetIpDyn"]
        if L10_11 == "0" then
          L10_11 = A0_1["Wan.PIpAddr"]
          L7_8["PppoeProfile.StaticIp"] = L10_11
          L10_11 = A0_1["Wan.PSnetMask"]
          L7_8["PppoeProfile.NetMask"] = L10_11
        end
        L10_11 = A0_1["Wan.IsDNSDyn"]
        if L10_11 == "0" then
          L10_11 = A0_1["Wan.PriDnsIpAddr"]
          L7_8["PppoeProfile.PrimaryDns"] = L10_11
          L10_11 = A0_1["Wan.SecDnsIpAddr"]
          L7_8["PppoeProfile.SecondaryDns"] = L10_11
        end
        L10_11 = A0_1["Wan.PppoeIdleTimeOutFlag"]
        L7_8["PppoeProfile.IdleTimeOutFlag"] = L10_11
        L10_11 = A0_1["Wan.PppoeIdleTimeOutFlag"]
        if L10_11 == "1" then
          L10_11 = A0_1["Wan.PppoeIdleTimeOutValue"]
          L7_8["PppoeProfile.IdleTimeOutValue"] = L10_11
        end
        L10_11 = L9_10[1]
        if L10_11 ~= nil then
          L10_11 = L9_10[1]
          L10_11 = L10_11["PppoeProfile.ProfileName"]
          L7_8["PppoeProfile.ProfileName"] = L10_11
          L10_11 = pppoe
          L10_11 = L10_11.profileConfig
          L10_11 = L10_11(L11_12, L12_13, L13_14)
          L5_6 = L10_11
        else
          L10_11 = pppoe
          L10_11 = L10_11.profileConfig
          L10_11 = L10_11(L11_12, L12_13, L13_14)
          L5_6 = L10_11
        end
        L10_11 = logIfName
        L8_9["PppoeProfile.LogicalIfName"] = L10_11
        L8_9["PppoeProfile.ProfileName"] = "pppoeProfile2"
        L8_9["PppoeProfile.Status"] = "1"
        L10_11 = A0_1["Wan.JAuthOpt"]
        L8_9["PppoeProfile.AuthOpt"] = L10_11
        L10_11 = A0_1["Wan.JUserName"]
        L8_9["PppoeProfile.UserName"] = L10_11
        L10_11 = util
        L10_11 = L10_11.isAllMasked
        L10_11 = L10_11(L11_12)
        if L10_11 == false then
          L10_11 = A0_1["Wan.JPassword"]
          L8_9["PppoeProfile.Password"] = L10_11
        end
        L10_11 = A0_1["Wan.JService"]
        L8_9["PppoeProfile.Service"] = L10_11
        L10_11 = A0_1["Wan.JIsGetIpDyn"]
        L8_9["PppoeProfile.GetIpFromIsp"] = L10_11
        L10_11 = A0_1["Wan.JIsDNSDyn"]
        L8_9["PppoeProfile.GetDnsFromIsp"] = L10_11
        L10_11 = A0_1["Wan.JIsGetIpDyn"]
        if L10_11 == "0" then
          L10_11 = A0_1["Wan.JIpAddr"]
          L8_9["PppoeProfile.StaticIp"] = L10_11
          L10_11 = A0_1["Wan.JSnetMask"]
          L8_9["PppoeProfile.NetMask"] = L10_11
        end
        L10_11 = A0_1["Wan.JIsDNSDyn"]
        if L10_11 == "0" then
          L10_11 = A0_1["Wan.JPriDnsIpAddr"]
          L8_9["PppoeProfile.PrimaryDns"] = L10_11
          L10_11 = A0_1["Wan.JSecDnsIpAddr"]
          L8_9["PppoeProfile.SecondaryDns"] = L10_11
        end
        L10_11 = A0_1["Wan.JPppoeIdleTimeOutFlag"]
        L8_9["PppoeProfile.IdleTimeOutFlag"] = L10_11
        L10_11 = A0_1["Wan.JPppoeIdleTimeOutFlag"]
        if L10_11 == "1" then
          L10_11 = A0_1["Wan.JPppoeIdleTimeOutValue"]
          L8_9["PppoeProfile.IdleTimeOutValue"] = L10_11
        end
        if L9_10 ~= nil then
          L10_11 = #L9_10
          if L10_11 == 2 then
            L10_11 = L9_10[2]
            L10_11 = L10_11["PppoeProfile.ProfileName"]
            L8_9["PppoeProfile.ProfileName"] = L10_11
            L10_11 = pppoe
            L10_11 = L10_11.profileConfig
            L10_11 = L10_11(L11_12, L12_13, L13_14)
            L5_6 = L10_11
          else
            L10_11 = pppoe
            L10_11 = L10_11.profileConfig
            L10_11 = L10_11(L11_12, L12_13, L13_14)
            L5_6 = L10_11
          end
        else
          L10_11 = pppoe
          L10_11 = L10_11.profileConfig
          L10_11 = L10_11(L11_12, L12_13, L13_14)
          L5_6 = L10_11
        end
      else
        L9_10 = A0_1["Wan.IspType"]
        if L9_10 == "2" then
          L9_10 = db
          L9_10 = L9_10.getRow
          L10_11 = "WanMode"
          L9_10 = L9_10(L10_11, L11_12, L12_13)
          L6_7["NimfConf.ConnectionType"] = "pptp"
          L10_11 = logIfName
          L7_8["Pptp.LogicalIfName"] = L10_11
          L10_11 = A0_1["Wan.LoginName"]
          L7_8["Pptp.UserName"] = L10_11
          L10_11 = util
          L10_11 = L10_11.isAllMasked
          L10_11 = L10_11(L11_12)
          if L10_11 == false then
            L10_11 = A0_1["Wan.LoginPassword"]
            L7_8["Pptp.Password"] = L10_11
          end
          L10_11 = A0_1["Wan.MppeEncryptSupport"]
          L7_8["Pptp.MppeEncryptSupport"] = L10_11
          L10_11 = A0_1["Wan.SplitTunnel"]
          L7_8["Pptp.SplitTunnel"] = L10_11
          L10_11 = A0_1["Wan.SvrIpAddr"]
          if L10_11 ~= nil then
            L10_11 = A0_1["Wan.SvrIpAddr"]
            L7_8["Pptp.ServerIp"] = L10_11
          else
            L10_11 = util
            L10_11 = L10_11.joinFields
            L14_15 = "."
            L15_16 = 4
            L10_11 = L10_11(L11_12, L12_13, L13_14, L14_15, L15_16)
            L7_8["Pptp.ServerIp"] = L10_11
          end
          L10_11 = A0_1["Wan.Gateway"]
          if L10_11 ~= nil then
            L10_11 = A0_1["Wan.Gateway"]
            L7_8["Pptp.Gateway"] = L10_11
          end
          L7_8["Pptp.DualAccess"] = "0"
          L10_11 = A0_1["Wan.IsGetIpDyn"]
          L7_8["Pptp.GetIpFromIsp"] = L10_11
          L10_11 = A0_1["Wan.IsDNSDyn"]
          L7_8["Pptp.GetDnsFromIsp"] = L10_11
          L10_11 = A0_1["Wan.IsGetIpDyn"]
          if L10_11 == "0" then
            L10_11 = util
            L10_11 = L10_11.joinFields
            L14_15 = "."
            L15_16 = 4
            L10_11 = L10_11(L11_12, L12_13, L13_14, L14_15, L15_16)
            L7_8["Pptp.StaticIp"] = L10_11
            L10_11 = util
            L10_11 = L10_11.joinFields
            L14_15 = "."
            L15_16 = 4
            L10_11 = L10_11(L11_12, L12_13, L13_14, L14_15, L15_16)
            L7_8["Pptp.NetMask"] = L10_11
            L10_11 = A0_1["Wan.StaticDNS"]
            L7_8["Pptp.StaticDNS"] = L10_11
          end
          L10_11 = A0_1["Wan.IsDNSDyn"]
          if L10_11 == "0" then
            L10_11 = util
            L10_11 = L10_11.joinFields
            L14_15 = "."
            L15_16 = 4
            L10_11 = L10_11(L11_12, L12_13, L13_14, L14_15, L15_16)
            L7_8["Pptp.PrimaryDns"] = L10_11
            L10_11 = util
            L10_11 = L10_11.joinFields
            L14_15 = "."
            L15_16 = 4
            L10_11 = L10_11(L11_12, L12_13, L13_14, L14_15, L15_16)
            L7_8["Pptp.SecondaryDns"] = L10_11
          end
          L10_11 = A0_1["Wan.IdleTimeOutFlag"]
          L7_8["Pptp.IdleTimeOutFlag"] = L10_11
          L10_11 = A0_1["Wan.IdleTimeOutFlag"]
          if L10_11 == "1" then
            L10_11 = A0_1["Wan.IdleTime"]
            L7_8["Pptp.IdleTimeOutValue"] = L10_11
          end
          L10_11 = db
          L10_11 = L10_11.existsRowWhere
          L14_15 = "'"
          L10_11 = L10_11(L11_12, L12_13)
          if L10_11 then
            L10_11 = pptp
            L10_11 = L10_11.config
            L14_15 = "LogicalIfName"
            L15_16 = logIfName
            L10_11 = L10_11(L11_12, L12_13, L13_14)
            L5_6 = L10_11
          else
            L10_11 = pptp
            L10_11 = L10_11.config
            L10_11 = L10_11(L11_12, L12_13, L13_14)
            L5_6 = L10_11
          end
        else
          L9_10 = A0_1["Wan.IspType"]
          if L9_10 == "4" then
            L6_7["NimfConf.ConnectionType"] = "pptp"
            L9_10 = logIfName
            L7_8["Pptp.LogicalIfName"] = L9_10
            L9_10 = A0_1["Wan.LoginName"]
            L7_8["Pptp.UserName"] = L9_10
            L9_10 = util
            L9_10 = L9_10.isAllMasked
            L10_11 = A0_1["Wan.LoginPassword"]
            L9_10 = L9_10(L10_11)
            if L9_10 == false then
              L9_10 = A0_1["Wan.LoginPassword"]
              L7_8["Pptp.Password"] = L9_10
            end
            L9_10 = A0_1["Wan.MppeEncryptSupport"]
            L7_8["Pptp.MppeEncryptSupport"] = L9_10
            L9_10 = A0_1["Wan.SplitTunnel"]
            L7_8["Pptp.SplitTunnel"] = L9_10
            L9_10 = A0_1["Wan.SvrIpAddr"]
            if L9_10 ~= nil then
              L9_10 = A0_1["Wan.SvrIpAddr"]
              L7_8["Pptp.ServerIp"] = L9_10
            else
              L9_10 = util
              L9_10 = L9_10.joinFields
              L10_11 = A0_1
              L14_15 = 4
              L9_10 = L9_10(L10_11, L11_12, L12_13, L13_14, L14_15)
              L7_8["Pptp.ServerIp"] = L9_10
            end
            L9_10 = A0_1["Wan.Gateway"]
            if L9_10 ~= nil then
              L9_10 = A0_1["Wan.Gateway"]
              L7_8["Pptp.Gateway"] = L9_10
            end
            L7_8["Pptp.DualAccess"] = "1"
            L9_10 = A0_1["Wan.IsGetIpDyn"]
            L7_8["Pptp.GetIpFromIsp"] = L9_10
            L9_10 = A0_1["Wan.IsDNSDyn"]
            L7_8["Pptp.GetDnsFromIsp"] = L9_10
            L9_10 = A0_1["Wan.IsGetIpDyn"]
            if L9_10 == "0" then
              L9_10 = util
              L9_10 = L9_10.joinFields
              L10_11 = A0_1
              L14_15 = 4
              L9_10 = L9_10(L10_11, L11_12, L12_13, L13_14, L14_15)
              L7_8["Pptp.StaticIp"] = L9_10
              L9_10 = util
              L9_10 = L9_10.joinFields
              L10_11 = A0_1
              L14_15 = 4
              L9_10 = L9_10(L10_11, L11_12, L12_13, L13_14, L14_15)
              L7_8["Pptp.NetMask"] = L9_10
              L9_10 = A0_1["Wan.StaticDNS"]
              L7_8["Pptp.StaticDNS"] = L9_10
            end
            L9_10 = A0_1["Wan.IsDNSDyn"]
            if L9_10 == "0" then
              L9_10 = util
              L9_10 = L9_10.joinFields
              L10_11 = A0_1
              L14_15 = 4
              L9_10 = L9_10(L10_11, L11_12, L12_13, L13_14, L14_15)
              L7_8["Pptp.PrimaryDns"] = L9_10
              L9_10 = util
              L9_10 = L9_10.joinFields
              L10_11 = A0_1
              L14_15 = 4
              L9_10 = L9_10(L10_11, L11_12, L12_13, L13_14, L14_15)
              L7_8["Pptp.SecondaryDns"] = L9_10
            end
            L9_10 = A0_1["Wan.IdleTimeOutFlag"]
            L7_8["Pptp.IdleTimeOutFlag"] = L9_10
            L9_10 = A0_1["Wan.IdleTimeOutFlag"]
            if L9_10 == "1" then
              L9_10 = A0_1["Wan.IdleTime"]
              L7_8["Pptp.IdleTimeOutValue"] = L9_10
            end
            L9_10 = db
            L9_10 = L9_10.existsRowWhere
            L10_11 = "Pptp"
            L9_10 = L9_10(L10_11, L11_12)
            if L9_10 then
              L9_10 = pptp
              L9_10 = L9_10.config
              L10_11 = L7_8
              L14_15 = logIfName
              L15_16 = "_ROWID_"
              L9_10 = L9_10(L10_11, L11_12, L12_13)
              L5_6 = L9_10
            else
              L9_10 = pptp
              L9_10 = L9_10.config
              L10_11 = L7_8
              L9_10 = L9_10(L10_11, L11_12, L12_13)
              L5_6 = L9_10
            end
          else
            L9_10 = A0_1["Wan.IspType"]
            if L9_10 == "3" then
              L9_10 = db
              L9_10 = L9_10.getRow
              L10_11 = "WanMode"
              L9_10 = L9_10(L10_11, L11_12, L12_13)
              L6_7["NimfConf.ConnectionType"] = "l2tp"
              L10_11 = logIfName
              L7_8["L2tp.LogicalIfName"] = L10_11
              L10_11 = A0_1["Wan.LoginName"]
              L7_8["L2tp.UserName"] = L10_11
              L10_11 = util
              L10_11 = L10_11.isAllMasked
              L10_11 = L10_11(L11_12)
              if L10_11 == false then
                L10_11 = A0_1["Wan.LoginPassword"]
                L7_8["L2tp.Password"] = L10_11
              end
              L10_11 = A0_1["Wan.AccountName"]
              if L10_11 ~= nil then
                L10_11 = A0_1["Wan.AccountName"]
                L7_8["L2tp.AccountName"] = L10_11
              end
              L10_11 = A0_1["Wan.DomainName"]
              if L10_11 ~= nil then
                L10_11 = A0_1["Wan.DomainName"]
                L7_8["L2tp.DomainName"] = L10_11
              end
              L10_11 = A0_1["Wan.Secret"]
              if L10_11 ~= nil then
                L10_11 = util
                L10_11 = L10_11.isAllMasked
                L10_11 = L10_11(L11_12)
                if L10_11 == false then
                  L10_11 = A0_1["Wan.Secret"]
                  L7_8["L2tp.Secret"] = L10_11
                end
              end
              L10_11 = A0_1["Wan.SvrIpAddr"]
              if L10_11 ~= nil then
                L10_11 = A0_1["Wan.SvrIpAddr"]
                L7_8["L2tp.ServerIp"] = L10_11
              else
                L10_11 = util
                L10_11 = L10_11.joinFields
                L14_15 = "."
                L15_16 = 4
                L10_11 = L10_11(L11_12, L12_13, L13_14, L14_15, L15_16)
                L7_8["L2tp.ServerIp"] = L10_11
              end
              L10_11 = A0_1["Wan.Gateway"]
              if L10_11 ~= nil then
                L10_11 = A0_1["Wan.Gateway"]
                L7_8["L2tp.Gateway"] = L10_11
              end
              L7_8["L2tp.DualAccess"] = "0"
              L10_11 = A0_1["Wan.SplitTunnel"]
              L7_8["L2tp.SplitTunnel"] = L10_11
              L10_11 = A0_1["Wan.IsGetIpDyn"]
              L7_8["L2tp.GetIpFromIsp"] = L10_11
              L10_11 = A0_1["Wan.IsDNSDyn"]
              L7_8["L2tp.GetDnsFromIsp"] = L10_11
              L10_11 = A0_1["Wan.IsGetIpDyn"]
              if L10_11 == "0" then
                L10_11 = util
                L10_11 = L10_11.joinFields
                L14_15 = "."
                L15_16 = 4
                L10_11 = L10_11(L11_12, L12_13, L13_14, L14_15, L15_16)
                L7_8["L2tp.StaticIp"] = L10_11
                L10_11 = util
                L10_11 = L10_11.joinFields
                L14_15 = "."
                L15_16 = 4
                L10_11 = L10_11(L11_12, L12_13, L13_14, L14_15, L15_16)
                L7_8["L2tp.NetMask"] = L10_11
                L10_11 = A0_1["Wan.StaticDNS"]
                L7_8["L2tp.StaticDNS"] = L10_11
              end
              L10_11 = A0_1["Wan.IsDNSDyn"]
              if L10_11 == "0" then
                L10_11 = util
                L10_11 = L10_11.joinFields
                L14_15 = "."
                L15_16 = 4
                L10_11 = L10_11(L11_12, L12_13, L13_14, L14_15, L15_16)
                L7_8["L2tp.PrimaryDns"] = L10_11
                L10_11 = util
                L10_11 = L10_11.joinFields
                L14_15 = "."
                L15_16 = 4
                L10_11 = L10_11(L11_12, L12_13, L13_14, L14_15, L15_16)
                L7_8["L2tp.SecondaryDns"] = L10_11
              end
              L10_11 = A0_1["Wan.IdleTimeOutFlag"]
              L7_8["L2tp.IdleTimeOutFlag"] = L10_11
              L10_11 = A0_1["Wan.IdleTimeOutFlag"]
              if L10_11 == "1" then
                L10_11 = A0_1["Wan.IdleTime"]
                L7_8["L2tp.IdleTimeOutValue"] = L10_11
              end
              L10_11 = db
              L10_11 = L10_11.existsRowWhere
              L14_15 = "'"
              L10_11 = L10_11(L11_12, L12_13)
              if L10_11 then
                L10_11 = l2tp
                L10_11 = L10_11.config
                L14_15 = "LogicalIfName"
                L15_16 = logIfName
                L10_11 = L10_11(L11_12, L12_13, L13_14)
                L5_6 = L10_11
              else
                L10_11 = l2tp
                L10_11 = L10_11.config
                L10_11 = L10_11(L11_12, L12_13, L13_14)
                L5_6 = L10_11
              end
            else
              L9_10 = A0_1["Wan.IspType"]
              if L9_10 == "5" then
                L6_7["NimfConf.ConnectionType"] = "l2tp"
                L9_10 = logIfName
                L7_8["L2tp.LogicalIfName"] = L9_10
                L9_10 = A0_1["Wan.LoginName"]
                L7_8["L2tp.UserName"] = L9_10
                L9_10 = util
                L9_10 = L9_10.isAllMasked
                L10_11 = A0_1["Wan.LoginPassword"]
                L9_10 = L9_10(L10_11)
                if L9_10 == false then
                  L9_10 = A0_1["Wan.LoginPassword"]
                  L7_8["L2tp.Password"] = L9_10
                end
                L9_10 = A0_1["Wan.AccountName"]
                if L9_10 ~= nil then
                  L9_10 = A0_1["Wan.AccountName"]
                  L7_8["L2tp.AccountName"] = L9_10
                end
                L9_10 = A0_1["Wan.DomainName"]
                if L9_10 ~= nil then
                  L9_10 = A0_1["Wan.DomainName"]
                  L7_8["L2tp.DomainName"] = L9_10
                end
                L9_10 = A0_1["Wan.Secret"]
                if L9_10 ~= nil then
                  L9_10 = util
                  L9_10 = L9_10.isAllMasked
                  L10_11 = A0_1["Wan.Secret"]
                  L9_10 = L9_10(L10_11)
                  if L9_10 == false then
                    L9_10 = A0_1["Wan.Secret"]
                    L7_8["L2tp.Secret"] = L9_10
                  end
                end
                L9_10 = A0_1["Wan.SvrIpAddr"]
                if L9_10 ~= nil then
                  L9_10 = A0_1["Wan.SvrIpAddr"]
                  L7_8["L2tp.ServerIp"] = L9_10
                else
                  L9_10 = util
                  L9_10 = L9_10.joinFields
                  L10_11 = A0_1
                  L14_15 = 4
                  L9_10 = L9_10(L10_11, L11_12, L12_13, L13_14, L14_15)
                  L7_8["L2tp.ServerIp"] = L9_10
                end
                L9_10 = A0_1["Wan.Gateway"]
                if L9_10 ~= nil then
                  L9_10 = A0_1["Wan.Gateway"]
                  L7_8["L2tp.Gateway"] = L9_10
                end
                L7_8["L2tp.DualAccess"] = "1"
                L9_10 = A0_1["Wan.SplitTunnel"]
                L7_8["L2tp.SplitTunnel"] = L9_10
                L9_10 = A0_1["Wan.IsGetIpDyn"]
                L7_8["L2tp.GetIpFromIsp"] = L9_10
                L9_10 = A0_1["Wan.IsDNSDyn"]
                L7_8["L2tp.GetDnsFromIsp"] = L9_10
                L9_10 = A0_1["Wan.IsGetIpDyn"]
                if L9_10 == "0" then
                  L9_10 = util
                  L9_10 = L9_10.joinFields
                  L10_11 = A0_1
                  L14_15 = 4
                  L9_10 = L9_10(L10_11, L11_12, L12_13, L13_14, L14_15)
                  L7_8["L2tp.StaticIp"] = L9_10
                  L9_10 = util
                  L9_10 = L9_10.joinFields
                  L10_11 = A0_1
                  L14_15 = 4
                  L9_10 = L9_10(L10_11, L11_12, L12_13, L13_14, L14_15)
                  L7_8["L2tp.NetMask"] = L9_10
                  L9_10 = A0_1["Wan.StaticDNS"]
                  L7_8["L2tp.StaticDNS"] = L9_10
                end
                L9_10 = A0_1["Wan.IsDNSDyn"]
                if L9_10 == "0" then
                  L9_10 = util
                  L9_10 = L9_10.joinFields
                  L10_11 = A0_1
                  L14_15 = 4
                  L9_10 = L9_10(L10_11, L11_12, L12_13, L13_14, L14_15)
                  L7_8["L2tp.PrimaryDns"] = L9_10
                  L9_10 = util
                  L9_10 = L9_10.joinFields
                  L10_11 = A0_1
                  L14_15 = 4
                  L9_10 = L9_10(L10_11, L11_12, L12_13, L13_14, L14_15)
                  L7_8["L2tp.SecondaryDns"] = L9_10
                end
                L9_10 = A0_1["Wan.IdleTimeOutFlag"]
                L7_8["L2tp.IdleTimeOutFlag"] = L9_10
                L9_10 = A0_1["Wan.IdleTimeOutFlag"]
                if L9_10 == "1" then
                  L9_10 = A0_1["Wan.IdleTime"]
                  L7_8["L2tp.IdleTimeOutValue"] = L9_10
                end
                L9_10 = db
                L9_10 = L9_10.existsRowWhere
                L10_11 = "L2tp"
                L9_10 = L9_10(L10_11, L11_12)
                if L9_10 then
                  L9_10 = l2tp
                  L9_10 = L9_10.config
                  L10_11 = L7_8
                  L14_15 = logIfName
                  L15_16 = "_ROWID_"
                  L9_10 = L9_10(L10_11, L11_12, L12_13)
                  L5_6 = L9_10
                else
                  L9_10 = l2tp
                  L9_10 = L9_10.config
                  L10_11 = L7_8
                  L9_10 = L9_10(L10_11, L11_12, L12_13)
                  L5_6 = L9_10
                end
              else
                L9_10 = A0_1["Wan.IspType"]
                if L9_10 == "7" then
                  L6_7["NimfConf.ConnectionType"] = "threeg"
                  L9_10 = logIfName
                  L7_8["ThreeG.LogicalIfName"] = L9_10
                  L9_10 = A0_1["Wan.UserName"]
                  L7_8["ThreeG.UserName"] = L9_10
                  L9_10 = A0_1["Wan.Password"]
                  if L9_10 ~= nil then
                    L9_10 = util
                    L9_10 = L9_10.isAllMasked
                    L10_11 = A0_1["Wan.Password"]
                    L9_10 = L9_10(L10_11)
                    if L9_10 == false then
                      L9_10 = A0_1["Wan.Password"]
                      L7_8["ThreeG.Password"] = L9_10
                    end
                  end
                  L9_10 = A0_1["Wan.DialNumber"]
                  L7_8["ThreeG.DialNumber"] = L9_10
                  L9_10 = A0_1["Wan.AuthMethod"]
                  L7_8["ThreeG.AuthMethod"] = L9_10
                  L9_10 = A0_1["Wan.APN"]
                  L7_8["ThreeG.Apn"] = L9_10
                  L9_10 = A0_1["Wan.IdleTimeOutFlag"]
                  L7_8["ThreeG.IdleTimeOutFlag"] = L9_10
                  L9_10 = A0_1["Wan.IdleTimeOutFlag"]
                  if L9_10 == "1" then
                    L9_10 = A0_1["Wan.IdleTime"]
                    L7_8["ThreeG.IdleTimeOutValue"] = L9_10
                  end
                  L9_10 = A0_1["Wan.IsDNSDyn"]
                  L7_8["ThreeG.GetDnsFromIsp"] = L9_10
                  L9_10 = A0_1["Wan.ApnRequired"]
                  L7_8["ThreeG.ApnRequired"] = L9_10
                  L9_10 = A0_1["Wan.IsDNSDyn"]
                  if L9_10 == "0" then
                    L9_10 = A0_1["Wan.PriDnsIpAddr"]
                    L7_8["ThreeG.PrimaryDns"] = L9_10
                    L9_10 = A0_1["Wan.SecDnsIpAddr"]
                    L7_8["ThreeG.SecondaryDns"] = L9_10
                  end
                  L9_10 = db
                  L9_10 = L9_10.existsRowWhere
                  L10_11 = "ThreeG"
                  L9_10 = L9_10(L10_11, L11_12)
                  if L9_10 then
                    L9_10 = ThreeGInternet
                    L9_10 = L9_10.config
                    L10_11 = L7_8
                    L14_15 = logIfName
                    L15_16 = "_ROWID_"
                    L9_10 = L9_10(L10_11, L11_12, L12_13)
                    L5_6 = L9_10
                  else
                    L9_10 = ThreeGInternet
                    L9_10 = L9_10.config
                    L10_11 = L7_8
                    L9_10 = L9_10(L10_11, L11_12, L12_13)
                    L5_6 = L9_10
                  end
                else
                  L9_10 = A0_1["Wan.IspType"]
                  if L9_10 == "8" then
                    L9_10 = db
                    L9_10 = L9_10.getRowWhere
                    L10_11 = "DualPppoe"
                    L9_10 = L9_10(L10_11, L11_12)
                    L6_7["NimfConf.ConnectionType"] = "dualPppoe"
                    L10_11 = logIfName
                    L7_8["DualPppoe.LogicalIfName"] = L10_11
                    L10_11 = A0_1["Wan.AuthOpt"]
                    L7_8["DualPppoe.AuthOpt"] = L10_11
                    L10_11 = A0_1["Wan.UserName"]
                    L7_8["DualPppoe.UserName"] = L10_11
                    L10_11 = util
                    L10_11 = L10_11.isAllMasked
                    L10_11 = L10_11(L11_12)
                    if L10_11 == false then
                      L10_11 = A0_1["Wan.Password"]
                      L7_8["DualPppoe.Password"] = L10_11
                    end
                    L10_11 = A0_1["Wan.Service"]
                    L7_8["DualPppoe.Service"] = L10_11
                    L10_11 = A0_1["Wan.PIsGetIpDyn"]
                    L7_8["DualPppoe.GetIpFromIsp"] = L10_11
                    L10_11 = A0_1["Wan.IsDNSDyn"]
                    L7_8["DualPppoe.GetDnsFromIsp"] = L10_11
                    L10_11 = A0_1["Wan.PIsGetIpDyn"]
                    if L10_11 == "0" then
                      L10_11 = A0_1["Wan.PIpAddr"]
                      L7_8["DualPppoe.StaticIp"] = L10_11
                      L10_11 = A0_1["Wan.PSnetMask"]
                      L7_8["DualPppoe.NetMask"] = L10_11
                      L10_11 = util
                      L10_11 = L10_11.appendDebugOut
                      L10_11(L11_12)
                    end
                    L10_11 = A0_1["Wan.IsDNSDyn"]
                    if L10_11 == "0" then
                      L10_11 = A0_1["Wan.PriDnsIpAddr"]
                      L7_8["DualPppoe.PrimaryDns"] = L10_11
                      L10_11 = A0_1["Wan.SecDnsIpAddr"]
                      L7_8["DualPppoe.SecondaryDns"] = L10_11
                    end
                    L10_11 = A0_1["Wan.PppoeIdleTimeOutFlag"]
                    L7_8["DualPppoe.IdleTimeOutFlag"] = L10_11
                    L10_11 = A0_1["Wan.PppoeIdleTimeOutFlag"]
                    if L10_11 == "1" then
                      L10_11 = A0_1["Wan.PppoeIdleTimeOutValue"]
                      L7_8["DualPppoe.IdleTimeOutValue"] = L10_11
                    end
                    L10_11 = A0_1["Wan.GetIpFromIspPhy"]
                    L7_8["DualPppoe.GetIpFromIspPhy"] = L10_11
                    L10_11 = A0_1["Wan.GetDnsFromIspPhy"]
                    L10_11 = L10_11 or "0"
                    L7_8["DualPppoe.GetDnsFromIspPhy"] = L10_11
                    L10_11 = A0_1["Wan.GetIpFromIspPhy"]
                    if L10_11 == "0" then
                      L10_11 = A0_1["Wan.StaticIpPhy"]
                      L7_8["DualPppoe.StaticIpPhy"] = L10_11
                      L10_11 = A0_1["Wan.NetMaskPhy"]
                      L7_8["DualPppoe.NetMaskPhy"] = L10_11
                      L10_11 = A0_1["Wan.GatewayPhy"]
                      L7_8["DualPppoe.GatewayPhy"] = L10_11
                    end
                    L10_11 = L7_8["DualPppoe.GetDnsFromIspPhy"]
                    if L10_11 == "0" then
                      L10_11 = A0_1["Wan.PrimaryDnsPhy"]
                      L7_8["DualPppoe.PrimaryDnsPhy"] = L10_11
                      L10_11 = A0_1["Wan.SecondaryDnsPhy"]
                      L7_8["DualPppoe.SecondaryDnsPhy"] = L10_11
                    end
                    L10_11 = db
                    L10_11 = L10_11.existsRowWhere
                    L14_15 = "'"
                    L10_11 = L10_11(L11_12, L12_13)
                    if L10_11 then
                      L10_11 = pppoe
                      L10_11 = L10_11.dualAccessConfig
                      L14_15 = "LogicalIfName"
                      L15_16 = logIfName
                      L10_11 = L10_11(L11_12, L12_13, L13_14)
                      L5_6 = L10_11
                    else
                      L10_11 = pppoe
                      L10_11 = L10_11.dualAccessConfig
                      L10_11 = L10_11(L11_12, L12_13, L13_14)
                      L5_6 = L10_11
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  if L5_6 then
    L9_10 = db
    L9_10 = L9_10.getRowsWhere
    L10_11 = "PppoeProfile"
    L9_10 = L9_10(L10_11, L11_12)
    L10_11 = db
    L10_11 = L10_11.getAttribute
    L14_15 = "ConnectionType"
    L10_11 = L10_11(L11_12, L12_13, L13_14, L14_15)
    if L10_11 == "pppoe" then
      if L11_12 ~= "pppoe" then
        if L9_10 ~= nil then
          if L11_12 ~= 0 then
            for L14_15, L15_16 in L11_12(L12_13) do
              L15_16["PppoeProfile.Status"] = "0"
              L5_6 = db.update("PppoeProfile", L15_16, L15_16["PppoeProfile._ROWID_"])
              if not L5_6 then
                break
              end
            end
          end
        end
      end
    elseif L11_12 == "1" then
      if L11_12 == 2 then
        L11_12["PppoeProfile.Status"] = "0"
        L14_15 = L9_10[2]
        L14_15 = L14_15["PppoeProfile._ROWID_"]
        L5_6 = L11_12
      end
    end
  end
  L9_10 = A0_1["Wan.DefMtu"]
  if L9_10 ~= nil then
    L9_10 = A0_1["Wan.DefMtu"]
    L6_7["NimfConf.UseDefaultMtu"] = L9_10
    L9_10 = A0_1["Wan.PortSpeed"]
    L6_7["NimfConf.PortSpeed"] = L9_10
    L9_10 = A0_1["Wan.DefMtu"]
    if L9_10 == "0" then
      L9_10 = A0_1["Wan.MtuSize"]
      L6_7["NimfConf.MtuSize"] = L9_10
    else
      L9_10 = L6_7["NimfConf.RequireLogin"]
      if L9_10 == "0" then
        L6_7["NimfConf.MtuSize"] = "1500"
      else
        L6_7["NimfConf.MtuSize"] = "1492"
      end
    end
  end
  L9_10 = A0_1["Wan.UseMac"]
  if L9_10 ~= nil then
    L9_10 = A0_1["Wan.UseMac"]
    L6_7["NimfConf.SetMacAddress"] = L9_10
    L9_10 = A0_1["Wan.UseMac"]
    if L9_10 == "2" then
      L9_10 = A0_1["Wan.MacAddr"]
      L6_7["NimfConf.MacAddress"] = L9_10
    end
  end
  if L5_6 then
    L9_10 = nimf
    L9_10 = L9_10.config
    L10_11 = L6_7
    L9_10 = L9_10(L10_11, L11_12, L12_13)
    L5_6 = L9_10
  end
  if L5_6 then
    L9_10 = "_ROWID_=1"
    L10_11 = db
    L10_11 = L10_11.getRowWhere
    L10_11 = L10_11(L11_12, L12_13)
    if L11_12 == "1" then
      if L11_12 == "WAN1" then
        if L11_12 ~= "2" then
        else
          if L11_12 == "4" then
            L10_11["Igmp.upstreamInterfaceWAN1"] = "1"
        end
        else
          if L11_12 ~= "3" then
          else
            if L11_12 == "5" then
              L10_11["Igmp.upstreamInterfaceWAN1"] = "2"
          end
          else
            L10_11["Igmp.upstreamInterfaceWAN1"] = "0"
          end
        end
      elseif L11_12 == "WAN2" then
        if L11_12 ~= "2" then
        else
          if L11_12 == "4" then
            L10_11["Igmp.upstreamInterfaceWAN2"] = "1"
        end
        else
          if L11_12 ~= "3" then
          else
            if L11_12 == "5" then
              L10_11["Igmp.upstreamInterfaceWAN2"] = "2"
          end
          else
            L10_11["Igmp.upstreamInterfaceWAN2"] = "0"
          end
        end
      end
    end
    L14_15 = "edit"
    statusCode = L12_13
    errorFlag = L11_12
    if L11_12 == "OK" then
      return L11_12, L12_13
    else
      return L11_12, L12_13
    end
  else
    L9_10 = "ERROR"
    L10_11 = "10992"
    return L9_10, L10_11
  end
end
function nimfView.wanConfigGet()
  local L0_17
  L0_17 = {}
  if db.getRowWhere("NimfConf", "LogicalIfName = '" .. logIfName .. "' and AddressFamily = " .. addressFamily) ~= nil then
    L0_17["Wan.IspLoginRequired"] = db.getRowWhere("NimfConf", "LogicalIfName = '" .. logIfName .. "' and AddressFamily = " .. addressFamily)["NimfConf.RequireLogin"]
    L0_17["Wan.vlanTagEnable"] = db.getRowWhere("NimfConf", "LogicalIfName = '" .. logIfName .. "' and AddressFamily = " .. addressFamily)["NimfConf.vlanTagEnable"]
    L0_17["Wan.vlanId"] = db.getRowWhere("NimfConf", "LogicalIfName = '" .. logIfName .. "' and AddressFamily = " .. addressFamily)["NimfConf.vlanId"]
    if db.getRowWhere("NimfConf", "LogicalIfName = '" .. logIfName .. "' and AddressFamily = " .. addressFamily)["NimfConf.ConnectionType"] == "dhcpc" then
      L0_17["Wan.IsGetIpDyn"] = "1"
      if db.getRowWhere("Dhcpc", "LogicalIfName = '" .. logIfName .. "'") ~= nil then
        L0_17["Wan.HostName"] = db.getRowWhere("Dhcpc", "LogicalIfName = '" .. logIfName .. "'")["Dhcpc.HostName"]
        L0_17["Wan.IsDNSDyn"] = db.getRowWhere("Dhcpc", "LogicalIfName = '" .. logIfName .. "'")["Dhcpc.GetDnsFromIsp"]
        L0_17["Wan.PriDnsIpAddr"] = db.getRowWhere("Dhcpc", "LogicalIfName = '" .. logIfName .. "'")["Dhcpc.PrimaryDns"] or ""
        L0_17["Wan.SecDnsIpAddr"] = db.getRowWhere("Dhcpc", "LogicalIfName = '" .. logIfName .. "'")["Dhcpc.SecondaryDns"] or ""
        L0_17["Wan.JIsGetIpDyn"] = "1"
        L0_17["Wan.IdleTimeOutFlag"] = "0"
        L0_17["Wan.PppoeIdleTimeOutFlag"] = "0"
        L0_17["Wan.JPppoeIdleTimeOutFlag"] = "0"
        L0_17["Wan.JIsDNSDyn"] = "1"
      end
    elseif db.getRowWhere("NimfConf", "LogicalIfName = '" .. logIfName .. "' and AddressFamily = " .. addressFamily)["NimfConf.ConnectionType"] == "ifStatic" then
      L0_17["Wan.IsGetIpDyn"] = "0"
      L0_17["Wan.IsDNSDyn"] = "0"
      if db.getRowWhere("ifStatic", "LogicalIfName = '" .. logIfName .. "'") ~= nil then
        L0_17["Wan.IpAddr"] = db.getRowWhere("ifStatic", "LogicalIfName = '" .. logIfName .. "'")["ifStatic.StaticIp"] or ""
        L0_17["Wan.SnetMask"] = db.getRowWhere("ifStatic", "LogicalIfName = '" .. logIfName .. "'")["ifStatic.NetMask"] or ""
        L0_17["Wan.GwIpAddr"] = db.getRowWhere("ifStatic", "LogicalIfName = '" .. logIfName .. "'")["ifStatic.Gateway"] or ""
        L0_17["Wan.PriDnsIpAddr"] = db.getRowWhere("ifStatic", "LogicalIfName = '" .. logIfName .. "'")["ifStatic.PrimaryDns"] or ""
        L0_17["Wan.SecDnsIpAddr"] = db.getRowWhere("ifStatic", "LogicalIfName = '" .. logIfName .. "'")["ifStatic.SecondaryDns"] or ""
      end
      L0_17["Wan.JIsGetIpDyn"] = "1"
      L0_17["Wan.IdleTimeOutFlag"] = "0"
      L0_17["Wan.PppoeIdleTimeOutFlag"] = "0"
      L0_17["Wan.JPppoeIdleTimeOutFlag"] = "0"
      L0_17["Wan.JIsDNSDyn"] = "1"
    elseif db.getRowWhere("NimfConf", "LogicalIfName = '" .. logIfName .. "' and AddressFamily = " .. addressFamily)["NimfConf.ConnectionType"] == "pppoe" then
      if db.getRowsWhere("PppoeProfile", "LogicalIfName = '" .. logIfName .. "' and Status=1") ~= nil then
        if #db.getRowsWhere("PppoeProfile", "LogicalIfName = '" .. logIfName .. "' and Status=1") == 2 then
          L0_17["Wan.IspType"] = "6"
        else
          L0_17["Wan.IspType"] = "1"
        end
      end
      if db.getRowsWhere("PppoeProfile", "LogicalIfName = '" .. logIfName .. "' and Status=1")[1] ~= nil then
        L0_17["Wan.UserName"] = db.getRowsWhere("PppoeProfile", "LogicalIfName = '" .. logIfName .. "' and Status=1")[1]["PppoeProfile.UserName"]
        L0_17["Wan.Password"] = util.mask(db.getRowsWhere("PppoeProfile", "LogicalIfName = '" .. logIfName .. "' and Status=1")[1]["PppoeProfile.Password"])
        L0_17["Wan.PIsGetIpDyn"] = db.getRowsWhere("PppoeProfile", "LogicalIfName = '" .. logIfName .. "' and Status=1")[1]["PppoeProfile.GetIpFromIsp"]
        L0_17["Wan.IsDNSDyn"] = db.getRowsWhere("PppoeProfile", "LogicalIfName = '" .. logIfName .. "' and Status=1")[1]["PppoeProfile.GetDnsFromIsp"]
        L0_17["Wan.PIpAddr"] = db.getRowsWhere("PppoeProfile", "LogicalIfName = '" .. logIfName .. "' and Status=1")[1]["PppoeProfile.StaticIp"] or ""
        L0_17["Wan.PSnetMask"] = db.getRowsWhere("PppoeProfile", "LogicalIfName = '" .. logIfName .. "' and Status=1")[1]["PppoeProfile.NetMask"] or ""
        L0_17["Wan.PriDnsIpAddr"] = db.getRowsWhere("PppoeProfile", "LogicalIfName = '" .. logIfName .. "' and Status=1")[1]["PppoeProfile.PrimaryDns"] or ""
        L0_17["Wan.SecDnsIpAddr"] = db.getRowsWhere("PppoeProfile", "LogicalIfName = '" .. logIfName .. "' and Status=1")[1]["PppoeProfile.SecondaryDns"] or ""
        L0_17["Wan.AuthOpt"] = db.getRowsWhere("PppoeProfile", "LogicalIfName = '" .. logIfName .. "' and Status=1")[1]["PppoeProfile.AuthOpt"]
        L0_17["Wan.PppoeIdleTimeOutFlag"] = db.getRowsWhere("PppoeProfile", "LogicalIfName = '" .. logIfName .. "' and Status=1")[1]["PppoeProfile.IdleTimeOutFlag"]
        L0_17["Wan.PppoeIdleTimeOutValue"] = db.getRowsWhere("PppoeProfile", "LogicalIfName = '" .. logIfName .. "' and Status=1")[1]["PppoeProfile.IdleTimeOutValue"] or "10"
        L0_17["Wan.Service"] = db.getRowsWhere("PppoeProfile", "LogicalIfName = '" .. logIfName .. "' and Status=1")[1]["PppoeProfile.Service"] or ""
      else
        L0_17["Wan.IspType"] = "1"
        L0_17["Wan.UserName"] = ""
        L0_17["Wan.Password"] = ""
        L0_17["Wan.IsGetIpDyn"] = "1"
        L0_17["Wan.IsDNSDyn"] = "1"
        L0_17["Wan.AuthOpt"] = "1"
        L0_17["Wan.PppoeIdleTimeOutFlag"] = "0"
        L0_17["Wan.PppoeIdleTimeOutValue"] = ""
      end
      if db.getRowsWhere("PppoeProfile", "LogicalIfName = '" .. logIfName .. "' and Status=1")[2] ~= nil then
        L0_17["Wan.JUserName"] = db.getRowsWhere("PppoeProfile", "LogicalIfName = '" .. logIfName .. "' and Status=1")[2]["PppoeProfile.UserName"]
        if db.getRowsWhere("PppoeProfile", "LogicalIfName = '" .. logIfName .. "' and Status=1")[2]["PppoeProfile.Password"] ~= nil then
          L0_17["Wan.JPassword"] = util.mask(db.getRowsWhere("PppoeProfile", "LogicalIfName = '" .. logIfName .. "' and Status=1")[2]["PppoeProfile.Password"])
        end
        L0_17["Wan.JIsGetIpDyn"] = db.getRowsWhere("PppoeProfile", "LogicalIfName = '" .. logIfName .. "' and Status=1")[2]["PppoeProfile.GetIpFromIsp"]
        L0_17["Wan.JIsDNSDyn"] = db.getRowsWhere("PppoeProfile", "LogicalIfName = '" .. logIfName .. "' and Status=1")[2]["PppoeProfile.GetDnsFromIsp"]
        L0_17["Wan.JIpAddr"] = db.getRowsWhere("PppoeProfile", "LogicalIfName = '" .. logIfName .. "' and Status=1")[2]["PppoeProfile.StaticIp"] or ""
        L0_17["Wan.JSnetMask"] = db.getRowsWhere("PppoeProfile", "LogicalIfName = '" .. logIfName .. "' and Status=1")[2]["PppoeProfile.NetMask"] or ""
        L0_17["Wan.JPriDnsIpAddr"] = db.getRowsWhere("PppoeProfile", "LogicalIfName = '" .. logIfName .. "' and Status=1")[2]["PppoeProfile.PrimaryDns"] or ""
        L0_17["Wan.JSecDnsIpAddr"] = db.getRowsWhere("PppoeProfile", "LogicalIfName = '" .. logIfName .. "' and Status=1")[2]["PppoeProfile.SecondaryDns"] or ""
        L0_17["Wan.JAuthOpt"] = db.getRowsWhere("PppoeProfile", "LogicalIfName = '" .. logIfName .. "' and Status=1")[2]["PppoeProfile.AuthOpt"]
        L0_17["Wan.JPppoeIdleTimeOutFlag"] = db.getRowsWhere("PppoeProfile", "LogicalIfName = '" .. logIfName .. "' and Status=1")[2]["PppoeProfile.IdleTimeOutFlag"]
        L0_17["Wan.JPppoeIdleTimeOutValue"] = db.getRowsWhere("PppoeProfile", "LogicalIfName = '" .. logIfName .. "' and Status=1")[2]["PppoeProfile.IdleTimeOutValue"] or "10"
        L0_17["Wan.JService"] = db.getRowsWhere("PppoeProfile", "LogicalIfName = '" .. logIfName .. "' and Status=1")[2]["PppoeProfile.Service"] or ""
      else
        L0_17["Wan.JIspType"] = "1"
        L0_17["Wan.JUserName"] = ""
        L0_17["Wan.JPassword"] = ""
        L0_17["Wan.JIsGetIpDyn"] = "1"
        L0_17["Wan.JIsDNSDyn"] = "1"
        L0_17["Wan.JAuthOpt"] = "1"
        L0_17["Wan.JPppoeIdleTimeOutFlag"] = "0"
        L0_17["Wan.JPppoeIdleTimeOutValue"] = ""
      end
      L0_17["Wan.IdleTimeOutFlag"] = "0"
    elseif db.getRowWhere("NimfConf", "LogicalIfName = '" .. logIfName .. "' and AddressFamily = " .. addressFamily)["NimfConf.ConnectionType"] == "pptp" then
      if db.getRowWhere("Pptp", "LogicalIfName = '" .. logIfName .. "'") ~= nil then
        if db.getRowWhere("Pptp", "LogicalIfName = '" .. logIfName .. "'")["Pptp.DualAccess"] == "1" then
          L0_17["Wan.IspType"] = "4"
        elseif db.getRowWhere("Pptp", "LogicalIfName = '" .. logIfName .. "'")["Pptp.DualAccess"] == "0" then
          L0_17["Wan.IspType"] = "2"
        end
        L0_17["Wan.LoginName"] = db.getRowWhere("Pptp", "LogicalIfName = '" .. logIfName .. "'")["Pptp.UserName"]
        L0_17["Wan.LoginPassword"] = util.mask(db.getRowWhere("Pptp", "LogicalIfName = '" .. logIfName .. "'")["Pptp.Password"])
        L0_17["Wan.SvrIpAddr"] = db.getRowWhere("Pptp", "LogicalIfName = '" .. logIfName .. "'")["Pptp.ServerIp"]
        L0_17["Wan.IsGetIpDyn"] = db.getRowWhere("Pptp", "LogicalIfName = '" .. logIfName .. "'")["Pptp.GetIpFromIsp"]
        L0_17["Wan.IsDNSDyn"] = db.getRowWhere("Pptp", "LogicalIfName = '" .. logIfName .. "'")["Pptp.GetDnsFromIsp"]
        L0_17["Wan.MppeEncryptSupport"] = db.getRowWhere("Pptp", "LogicalIfName = '" .. logIfName .. "'")["Pptp.MppeEncryptSupport"]
        L0_17["Wan.SplitTunnel"] = db.getRowWhere("Pptp", "LogicalIfName = '" .. logIfName .. "'")["Pptp.SplitTunnel"]
        L0_17["Wan.IpAddr"] = db.getRowWhere("Pptp", "LogicalIfName = '" .. logIfName .. "'")["Pptp.StaticIp"] or ""
        L0_17["Wan.SnetMask"] = db.getRowWhere("Pptp", "LogicalIfName = '" .. logIfName .. "'")["Pptp.NetMask"] or ""
        L0_17["Wan.Gateway"] = db.getRowWhere("Pptp", "LogicalIfName = '" .. logIfName .. "'")["Pptp.Gateway"] or ""
        L0_17["Wan.PriDnsIpAddr"] = db.getRowWhere("Pptp", "LogicalIfName = '" .. logIfName .. "'")["Pptp.PrimaryDns"] or ""
        L0_17["Wan.SecDnsIpAddr"] = db.getRowWhere("Pptp", "LogicalIfName = '" .. logIfName .. "'")["Pptp.SecondaryDns"] or ""
        L0_17["Wan.IdleTimeOutFlag"] = db.getRowWhere("Pptp", "LogicalIfName = '" .. logIfName .. "'")["Pptp.IdleTimeOutFlag"]
        L0_17["Wan.IdleTime"] = db.getRowWhere("Pptp", "LogicalIfName = '" .. logIfName .. "'")["Pptp.IdleTimeOutValue"] or "10"
        L0_17["Wan.StaticDNS"] = db.getRowWhere("Pptp", "LogicalIfName = '" .. logIfName .. "'")["Pptp.StaticDNS"]
      end
      L0_17["Wan.JIsGetIpDyn"] = "1"
      L0_17["Wan.PppoeIdleTimeOutFlag"] = "0"
      L0_17["Wan.JPppoeIdleTimeOutFlag"] = "0"
      L0_17["Wan.JIsDNSDyn"] = "1"
    elseif db.getRowWhere("NimfConf", "LogicalIfName = '" .. logIfName .. "' and AddressFamily = " .. addressFamily)["NimfConf.ConnectionType"] == "l2tp" then
      if db.getRowWhere("L2tp", "LogicalIfName = '" .. logIfName .. "'") ~= nil then
        if db.getRowWhere("L2tp", "LogicalIfName = '" .. logIfName .. "'")["L2tp.DualAccess"] == "1" then
          L0_17["Wan.IspType"] = "5"
        elseif db.getRowWhere("L2tp", "LogicalIfName = '" .. logIfName .. "'")["L2tp.DualAccess"] == "0" then
          L0_17["Wan.IspType"] = "3"
        end
        L0_17["Wan.LoginName"] = db.getRowWhere("L2tp", "LogicalIfName = '" .. logIfName .. "'")["L2tp.UserName"]
        L0_17["Wan.LoginPassword"] = util.mask(db.getRowWhere("L2tp", "LogicalIfName = '" .. logIfName .. "'")["L2tp.Password"])
        L0_17["Wan.AccountName"] = db.getRowWhere("L2tp", "LogicalIfName = '" .. logIfName .. "'")["L2tp.AccountName"]
        L0_17["Wan.DomainName"] = db.getRowWhere("L2tp", "LogicalIfName = '" .. logIfName .. "'")["L2tp.DomainName"]
        if db.getRowWhere("L2tp", "LogicalIfName = '" .. logIfName .. "'")["L2tp.Secret"] == nil then
          L0_17["Wan.Secret"] = ""
        else
          L0_17["Wan.Secret"] = util.mask(db.getRowWhere("L2tp", "LogicalIfName = '" .. logIfName .. "'")["L2tp.Secret"])
        end
        L0_17["Wan.SvrIpAddr"] = db.getRowWhere("L2tp", "LogicalIfName = '" .. logIfName .. "'")["L2tp.ServerIp"]
        L0_17["Wan.SplitTunnel"] = db.getRowWhere("L2tp", "LogicalIfName = '" .. logIfName .. "'")["L2tp.SplitTunnel"]
        L0_17["Wan.IsGetIpDyn"] = db.getRowWhere("L2tp", "LogicalIfName = '" .. logIfName .. "'")["L2tp.GetIpFromIsp"]
        L0_17["Wan.IsDNSDyn"] = db.getRowWhere("L2tp", "LogicalIfName = '" .. logIfName .. "'")["L2tp.GetDnsFromIsp"]
        L0_17["Wan.IpAddr"] = db.getRowWhere("L2tp", "LogicalIfName = '" .. logIfName .. "'")["L2tp.StaticIp"] or ""
        L0_17["Wan.SnetMask"] = db.getRowWhere("L2tp", "LogicalIfName = '" .. logIfName .. "'")["L2tp.NetMask"] or ""
        L0_17["Wan.Gateway"] = db.getRowWhere("L2tp", "LogicalIfName = '" .. logIfName .. "'")["L2tp.Gateway"] or ""
        L0_17["Wan.PriDnsIpAddr"] = db.getRowWhere("L2tp", "LogicalIfName = '" .. logIfName .. "'")["L2tp.PrimaryDns"] or ""
        L0_17["Wan.SecDnsIpAddr"] = db.getRowWhere("L2tp", "LogicalIfName = '" .. logIfName .. "'")["L2tp.SecondaryDns"] or ""
        L0_17["Wan.IdleTimeOutFlag"] = db.getRowWhere("L2tp", "LogicalIfName = '" .. logIfName .. "'")["L2tp.IdleTimeOutFlag"]
        L0_17["Wan.IdleTime"] = db.getRowWhere("L2tp", "LogicalIfName = '" .. logIfName .. "'")["L2tp.IdleTimeOutValue"] or "10"
        L0_17["Wan.StaticDNS"] = db.getRowWhere("L2tp", "LogicalIfName = '" .. logIfName .. "'")["L2tp.StaticDNS"]
      end
      L0_17["Wan.JIsGetIpDyn"] = "1"
      L0_17["Wan.PppoeIdleTimeOutFlag"] = "0"
      L0_17["Wan.JPppoeIdleTimeOutFlag"] = "0"
      L0_17["Wan.JIsDNSDyn"] = "1"
    elseif db.getRowWhere("NimfConf", "LogicalIfName = '" .. logIfName .. "' and AddressFamily = " .. addressFamily)["NimfConf.ConnectionType"] == "threeg" then
      if db.getRowWhere("ThreeG", "LogicalIfName = '" .. logIfName .. "'") ~= nil then
        L0_17["Wan.IspType"] = "7"
        L0_17["Wan.UserName"] = db.getRowWhere("ThreeG", "LogicalIfName = '" .. logIfName .. "'")["ThreeG.UserName"] or ""
        if db.getRowWhere("ThreeG", "LogicalIfName = '" .. logIfName .. "'")["ThreeG.Password"] ~= nil then
          L0_17["Wan.Password"] = util.mask(db.getRowWhere("ThreeG", "LogicalIfName = '" .. logIfName .. "'")["ThreeG.Password"])
        else
          L0_17["Wan.Password"] = ""
        end
        L0_17["Wan.DialNumber"] = db.getRowWhere("ThreeG", "LogicalIfName = '" .. logIfName .. "'")["ThreeG.DialNumber"]
        L0_17["Wan.AuthMethod"] = db.getRowWhere("ThreeG", "LogicalIfName = '" .. logIfName .. "'")["ThreeG.AuthMethod"]
        L0_17["Wan.APN"] = db.getRowWhere("ThreeG", "LogicalIfName = '" .. logIfName .. "'")["ThreeG.Apn"]
        L0_17["Wan.IsGetIpDyn"] = db.getRowWhere("ThreeG", "LogicalIfName = '" .. logIfName .. "'")["ThreeG.GetIpFromIsp"]
        L0_17["Wan.IsDNSDyn"] = db.getRowWhere("ThreeG", "LogicalIfName = '" .. logIfName .. "'")["ThreeG.GetDnsFromIsp"]
        L0_17["Wan.PriDnsIpAddr"] = db.getRowWhere("ThreeG", "LogicalIfName = '" .. logIfName .. "'")["ThreeG.PrimaryDns"] or ""
        L0_17["Wan.SecDnsIpAddr"] = db.getRowWhere("ThreeG", "LogicalIfName = '" .. logIfName .. "'")["ThreeG.SecondaryDns"] or ""
        L0_17["Wan.IdleTimeOutFlag"] = db.getRowWhere("ThreeG", "LogicalIfName = '" .. logIfName .. "'")["ThreeG.IdleTimeOutFlag"]
        L0_17["Wan.IdleTime"] = db.getRowWhere("ThreeG", "LogicalIfName = '" .. logIfName .. "'")["ThreeG.IdleTimeOutValue"] or "10"
        L0_17["Wan.ApnRequired"] = db.getRowWhere("ThreeG", "LogicalIfName = '" .. logIfName .. "'")["ThreeG.ApnRequired"]
      end
      L0_17["Wan.JIsGetIpDyn"] = "1"
      L0_17["Wan.PppoeIdleTimeOutFlag"] = "0"
      L0_17["Wan.JPppoeIdleTimeOutFlag"] = "0"
      L0_17["Wan.JIsDNSDyn"] = "1"
    elseif db.getRowWhere("NimfConf", "LogicalIfName = '" .. logIfName .. "' and AddressFamily = " .. addressFamily)["NimfConf.ConnectionType"] == "dualPppoe" then
      L0_17["Wan.IspType"] = "8"
      if db.getRowWhere("DualPppoe", "LogicalIfName = '" .. logIfName .. "'") ~= nil then
        L0_17["Wan.UserName"] = db.getRowWhere("DualPppoe", "LogicalIfName = '" .. logIfName .. "'")["DualPppoe.UserName"]
        L0_17["Wan.Password"] = util.mask(db.getRowWhere("DualPppoe", "LogicalIfName = '" .. logIfName .. "'")["DualPppoe.Password"]) or ""
        L0_17["Wan.PIsGetIpDyn"] = db.getRowWhere("DualPppoe", "LogicalIfName = '" .. logIfName .. "'")["DualPppoe.GetIpFromIsp"]
        L0_17["Wan.IsDNSDyn"] = db.getRowWhere("DualPppoe", "LogicalIfName = '" .. logIfName .. "'")["DualPppoe.GetDnsFromIsp"]
        L0_17["Wan.PIpAddr"] = db.getRowWhere("DualPppoe", "LogicalIfName = '" .. logIfName .. "'")["DualPppoe.StaticIp"] or ""
        L0_17["Wan.PSnetMask"] = db.getRowWhere("DualPppoe", "LogicalIfName = '" .. logIfName .. "'")["DualPppoe.NetMask"] or ""
        L0_17["Wan.PriDnsIpAddr"] = db.getRowWhere("DualPppoe", "LogicalIfName = '" .. logIfName .. "'")["DualPppoe.PrimaryDns"] or ""
        L0_17["Wan.SecDnsIpAddr"] = db.getRowWhere("DualPppoe", "LogicalIfName = '" .. logIfName .. "'")["DualPppoe.SecondaryDns"] or ""
        L0_17["Wan.AuthOpt"] = db.getRowWhere("DualPppoe", "LogicalIfName = '" .. logIfName .. "'")["DualPppoe.AuthOpt"]
        L0_17["Wan.PppoeIdleTimeOutFlag"] = db.getRowWhere("DualPppoe", "LogicalIfName = '" .. logIfName .. "'")["DualPppoe.IdleTimeOutFlag"]
        L0_17["Wan.PppoeIdleTimeOutValue"] = db.getRowWhere("DualPppoe", "LogicalIfName = '" .. logIfName .. "'")["DualPppoe.IdleTimeOutValue"] or "10"
        L0_17["Wan.Service"] = db.getRowWhere("DualPppoe", "LogicalIfName = '" .. logIfName .. "'")["DualPppoe.Service"] or ""
        L0_17["Wan.GetIpFromIspPhy"] = db.getRowWhere("DualPppoe", "LogicalIfName = '" .. logIfName .. "'")["DualPppoe.GetIpFromIspPhy"]
        L0_17["Wan.GetDnsFromIspPhy"] = db.getRowWhere("DualPppoe", "LogicalIfName = '" .. logIfName .. "'")["DualPppoe.GetDnsFromIspPhy"]
        L0_17["Wan.StaticIpPhy"] = db.getRowWhere("DualPppoe", "LogicalIfName = '" .. logIfName .. "'")["DualPppoe.StaticIpPhy"] or ""
        L0_17["Wan.NetMaskPhy"] = db.getRowWhere("DualPppoe", "LogicalIfName = '" .. logIfName .. "'")["DualPppoe.NetMaskPhy"] or ""
        L0_17["Wan.GatewayPhy"] = db.getRowWhere("DualPppoe", "LogicalIfName = '" .. logIfName .. "'")["DualPppoe.GatewayPhy"]
        L0_17["Wan.PrimaryDnsPhy"] = db.getRowWhere("DualPppoe", "LogicalIfName = '" .. logIfName .. "'")["DualPppoe.PrimaryDnsPhy"] or ""
        L0_17["Wan.SecondaryDnsPhy"] = db.getRowWhere("DualPppoe", "LogicalIfName = '" .. logIfName .. "'")["DualPppoe.SecondaryDnsPhy"] or ""
      else
        L0_17["Wan.IspType"] = "1"
        L0_17["Wan.UserName"] = ""
        L0_17["Wan.Password"] = ""
        L0_17["Wan.IsGetIpDyn"] = "1"
        L0_17["Wan.IsDNSDyn"] = "1"
        L0_17["Wan.AuthOpt"] = "1"
        L0_17["Wan.PppoeIdleTimeOutFlag"] = "0"
        L0_17["Wan.PppoeIdleTimeOutValue"] = ""
      end
      L0_17["Wan.JIspType"] = "1"
      L0_17["Wan.JUserName"] = ""
      L0_17["Wan.JPassword"] = ""
      L0_17["Wan.JIsGetIpDyn"] = "1"
      L0_17["Wan.JIsDNSDyn"] = "1"
      L0_17["Wan.JAuthOpt"] = "1"
      L0_17["Wan.JPppoeIdleTimeOutFlag"] = "0"
      L0_17["Wan.JPppoeIdleTimeOutValue"] = ""
      L0_17["Wan.IdleTimeOutFlag"] = "0"
    end
  end
  return L0_17
end
function nimfView.advConfig(A0_18, A1_19, A2_20)
  local L3_21, L4_22, L5_23, L6_24, L7_25, L8_26
  L3_21 = ACCESS_LEVEL
  if L3_21 ~= 0 then
    L3_21 = "ACCESS_DENIED"
    L4_22 = "10187"
    return L3_21, L4_22
  end
  L3_21 = db
  L3_21 = L3_21.getRowWhere
  L4_22 = "NimfConf"
  L5_23 = "LogicalIfName = '"
  L6_24 = logIfName
  L7_25 = "' and AddressFamily = "
  L8_26 = addressFamily
  L5_23 = L5_23 .. L6_24 .. L7_25 .. L8_26
  L3_21 = L3_21(L4_22, L5_23)
  L4_22 = 1
  while L3_21 == nil and L4_22 <= 3 do
    L5_23 = db
    L5_23 = L5_23.getRowWhere
    L6_24 = "NimfConf"
    L7_25 = "LogicalIfName = '"
    L8_26 = logIfName
    L7_25 = L7_25 .. L8_26 .. "' and AddressFamily = " .. addressFamily
    L5_23 = L5_23(L6_24, L7_25)
    L3_21 = L5_23
    L4_22 = L4_22 + 1
  end
  if L3_21 == nil then
    L5_23 = "ERROR"
    L6_24 = "10993"
    return L5_23, L6_24
  end
  A1_19 = L3_21["NimfConf._ROWID_"]
  L5_23 = db
  L5_23 = L5_23.beginTransaction
  L5_23()
  L5_23 = false
  L6_24 = {}
  L7_25 = db
  L7_25 = L7_25.getRowWhere
  L8_26 = "NimfConf"
  L7_25 = L7_25(L8_26, "LogicalIfName = '" .. logIfName .. "'")
  if L7_25 ~= nil then
    L8_26 = A0_18["Wan.DefMtu"]
    L7_25["NimfConf.UseDefaultMtu"] = L8_26
    L8_26 = A0_18["Wan.UseMac"]
    L7_25["NimfConf.SetMacAddress"] = L8_26
    L8_26 = A0_18["Wan.PortSpeed"]
    L7_25["NimfConf.PortSpeed"] = L8_26
    L8_26 = A0_18["Wan.DefMtu"]
    if L8_26 == "0" then
      L8_26 = A0_18["Wan.MtuSize"]
      L7_25["NimfConf.MtuSize"] = L8_26
    else
      L8_26 = L7_25["NimfConf.RequireLogin"]
      if L8_26 == "0" then
        L7_25["NimfConf.MtuSize"] = "1500"
      else
        L7_25["NimfConf.MtuSize"] = "1492"
      end
    end
    L8_26 = A0_18["Wan.UseMac"]
    if L8_26 == "2" then
      L8_26 = A0_18["Wan.MacAddr"]
      L7_25["NimfConf.MacAddress"] = L8_26
    end
    L7_25["NimfConf.AddressFamily"] = "2"
    L8_26 = nimf
    L8_26 = L8_26.config
    L8_26 = L8_26(L7_25, A1_19, "edit")
    L5_23 = L8_26
    if L5_23 == false then
      L8_26 = db
      L8_26 = L8_26.rollback
      L8_26()
      L8_26 = "ERROR"
      return L8_26, "10992"
    end
  end
  L8_26 = A0_18["NatTable.Enable"]
  if L8_26 ~= nil and L5_23 then
    L8_26 = {}
    L8_26["NatTable.Enable"] = A0_18["NatTable.Enable"]
    L5_23 = nat.config(L8_26, "1", "edit")
  end
  L8_26 = A0_18["Igmp.IgmpEnable"]
  if L8_26 ~= nil and L5_23 then
    L8_26 = {}
    L8_26["Igmp.IgmpEnable"] = A0_18["Igmp.IgmpEnable"]
    L5_23 = igmp.config(L8_26, "1", "edit")
  end
  if L5_23 then
    L8_26 = db
    L8_26 = L8_26.commitTransaction
    L8_26(true)
    L8_26 = "OK"
    return L8_26, "12265"
  else
    L8_26 = db
    L8_26 = L8_26.rollback
    L8_26()
    L8_26 = "ERROR"
    return L8_26, "10992"
  end
end
function nimfView.wanAdvConfigGet()
  local L0_27, L1_28
  L0_27 = {}
  L1_28 = nil
  if db.getRowWhere("NimfConf", "LogicalIfName = '" .. logIfName .. "' and AddressFamily = " .. addressFamily) ~= nil then
    L0_27["Wan.DefMtu"] = db.getRowWhere("NimfConf", "LogicalIfName = '" .. logIfName .. "' and AddressFamily = " .. addressFamily)["NimfConf.UseDefaultMtu"] or ""
    L0_27["Wan.MtuSize"] = db.getRowWhere("NimfConf", "LogicalIfName = '" .. logIfName .. "' and AddressFamily = " .. addressFamily)["NimfConf.MtuSize"] or ""
    L0_27["Wan.UseMac"] = db.getRowWhere("NimfConf", "LogicalIfName = '" .. logIfName .. "' and AddressFamily = " .. addressFamily)["NimfConf.SetMacAddress"] or ""
    L0_27["Wan.PortSpeed"] = db.getRowWhere("NimfConf", "LogicalIfName = '" .. logIfName .. "' and AddressFamily = " .. addressFamily)["NimfConf.PortSpeed"] or ""
    L0_27["Wan.MacAddr"] = db.getRowWhere("NimfConf", "LogicalIfName = '" .. logIfName .. "' and AddressFamily = " .. addressFamily)["NimfConf.MacAddress"] or ""
    if db.getRowWhere("NimfConf", "LogicalIfName = '" .. logIfName .. "' and AddressFamily = " .. addressFamily)["NimfConf.RequireLogin"] == "0" then
      L0_27["Wan.MtuSizeMin"] = "68"
      L0_27["Wan.MtuSizeMax"] = "1500"
    else
      L0_27["Wan.MtuSizeMin"] = "128"
      L0_27["Wan.MtuSizeMax"] = "1492"
    end
  end
  L0_27["NatTable.Enable"] = db.getAttribute("NatTable", "_ROWID_", "1", "Enable") or ""
  L0_27["Igmp.IgmpEnable"] = db.getAttribute("Igmp", "_ROWID_", "1", "IgmpEnable") or ""
  return L0_27
end
function nimfView.wanStatusGet()
  local L0_29, L1_30, L2_31, L3_32, L4_33, L5_34, L6_35, L7_36
  L0_29 = {}
  L1_30 = nil
  L2_31 = db
  L2_31 = L2_31.getRowWhere
  L3_32 = "NimfConf"
  L4_33 = "LogicalIfName = '"
  L5_34 = logIfName
  L6_35 = "' and AddressFamily = "
  L4_33 = L4_33 .. L5_34 .. L6_35 .. L7_36
  L2_31 = L2_31(L3_32, L4_33)
  if L2_31 ~= nil then
    L3_32 = L2_31["NimfConf.ConnectionType"]
    L4_33 = addressFamily
    if L4_33 == "10" then
      L3_32 = L2_31["NimfConf.ConnectionType6"]
    end
    if L3_32 == "dhcpc" then
      L0_29["Wan.ConnectionType"] = "Dynamic IP (DHCP)"
      L4_33 = db
      L4_33 = L4_33.getRowWhere
      L5_34 = "DhcpStatus"
      L6_35 = "LogicalIfName = '"
      L6_35 = L6_35 .. L7_36 .. "'"
      L4_33 = L4_33(L5_34, L6_35)
      if L4_33 ~= nil then
        L5_34 = L4_33["DhcpStatus.DhcpServerIp"]
        L0_29["Dhcpc.DhcpServerIp"] = L5_34
        L5_34 = L4_33["DhcpStatus.LeaseTime"]
        L0_29["Dhcpc.LeaseTime"] = L5_34
        L5_34 = L4_33["DhcpStatus.LeaseObtained"]
        L0_29["Dhcpc.LeaseObtained"] = L5_34
      end
    elseif L3_32 == "dhcp6c" then
      L0_29["Wan.ConnectionType"] = "Dynamic IP (DHCP)"
      L0_29["Wan.IPVersion"] = "ipv6"
    elseif L3_32 == "ifStatic" or L3_32 == "ifStatic6" then
      L0_29["Wan.ConnectionType"] = "Static IP"
    elseif L3_32 == "pppoe" then
      L0_29["Wan.ConnectionType"] = "PPPoE (Username/Password)"
    elseif L3_32 == "pptp" then
      L0_29["Wan.ConnectionType"] = "PPTP (Username/Password)"
    elseif L3_32 == "l2tp" then
      L0_29["Wan.ConnectionType"] = "L2TP (Username/Password)"
    elseif L3_32 == "jpppoe" then
      L0_29["Wan.ConnectionType"] = "Japanese multiple PPPoE"
    elseif L3_32 == "rpptp" then
      L0_29["Wan.ConnectionType"] = "Russian dual access PPTP"
    elseif L3_32 == "rl2tp" then
      L0_29["Wan.ConnectionType"] = "Russian dual access L2TP"
    elseif L3_32 == "pppoe6" then
      L0_29["Wan.ConnectionType"] = "PPPoE over ipv6"
    end
    L4_33 = L2_31["NimfConf.IfStatus"]
    if L4_33 == "0" then
      L0_29["Wan.operation"] = "Enable"
    else
      L4_33 = L2_31["NimfConf.IfStatus"]
      if L4_33 == "1" then
        L0_29["Wan.operation"] = "Disable"
      end
    end
  end
  L3_32 = db
  L3_32 = L3_32.getRowWhere
  L4_33 = "NimfStatus"
  L5_34 = "LogicalIfName = '"
  L6_35 = logIfName
  L5_34 = L5_34 .. L6_35 .. L7_36 .. addressFamily
  L3_32 = L3_32(L4_33, L5_34)
  L1_30 = L3_32
  if L1_30 ~= nil then
    L3_32 = L1_30["NimfStatus.Nimfstatus"]
    L3_32 = L3_32 or ""
    L0_29["Wan.ConnectionState"] = L3_32
    L3_32 = L1_30["NimfStatus.WanUpTime"]
    L3_32 = L3_32 or ""
    L0_29["Wan.ConnectionTime"] = L3_32
    L3_32 = L1_30["NimfStatus.Linkstatus"]
    L3_32 = L3_32 or ""
    L0_29["Wan.LinkState"] = L3_32
  end
  L3_32 = addressFamily
  if L3_32 == "10" then
    L3_32 = db
    L3_32 = L3_32.getRowsWhere
    L4_33 = "ipAddressTable"
    L5_34 = "LogicalIfName = '"
    L6_35 = logIfName
    L5_34 = L5_34 .. L6_35 .. L7_36 .. addressFamily
    L3_32 = L3_32(L4_33, L5_34)
    L4_33 = db
    L4_33 = L4_33.getRowsWhere
    L5_34 = "defaultRouters"
    L6_35 = "LogicalIfName = '"
    L6_35 = L6_35 .. L7_36 .. "' and AddressFamily = " .. addressFamily
    L4_33 = L4_33(L5_34, L6_35)
    L5_34 = db
    L5_34 = L5_34.getRowsWhere
    L6_35 = "resolverConfig"
    L5_34 = L5_34(L6_35, L7_36)
    L0_29["Wan.IpAddr"] = ""
    L0_29["Wan.Gateway"] = ""
    L0_29["Wan.DNS"] = ""
    L0_29["Wan.SDNS"] = ""
    L6_35 = 0
    for _FORV_10_, _FORV_11_ in L7_36(L3_32) do
      L6_35 = L6_35 + 1
      L0_29["Wan.IpAddr"] = L0_29["Wan.IpAddr"] .. L3_32[L6_35]["ipAddressTable.ipAddress"] .. "/" .. L3_32[L6_35]["ipAddressTable.ipv6PrefixLen"]
      if L6_35 ~= #L3_32 then
        L0_29["Wan.IpAddr"] = L0_29["Wan.IpAddr"] .. ", "
      end
    end
    L6_35 = 0
    for _FORV_11_, _FORV_12_ in pairs(L7_36) do
      L6_35 = L6_35 + 1
      L0_29["Wan.IpAddr"] = L0_29["Wan.IpAddr"] .. ", " .. L7_36[L6_35]["ipAddressTable.ipAddress"] .. "/" .. L7_36[L6_35]["ipAddressTable.ipv6PrefixLen"]
      if L6_35 ~= #L7_36 then
        L0_29["Wan.IpAddr"] = L0_29["Wan.IpAddr"] .. ", "
      end
    end
    L6_35 = 0
    for _FORV_11_, _FORV_12_ in pairs(L4_33) do
      L6_35 = L6_35 + 1
      L0_29["Wan.Gateway"] = L0_29["Wan.Gateway"] .. L4_33[L6_35]["defaultRouters.nextHopGateway"] or ""
      if L6_35 ~= #L4_33 then
        L0_29["Wan.Gateway"] = L0_29["Wan.Gateway"] .. ", "
      end
    end
    L6_35 = 0
    for _FORV_11_, _FORV_12_ in pairs(L5_34) do
      L6_35 = L6_35 + 1
      L0_29["Wan.DNS"] = L0_29["Wan.DNS"] .. L5_34[L6_35]["resolverConfig.nameserver1"] or ""
      L0_29["Wan.SDNS"] = L0_29["Wan.SDNS"] .. L5_34[L6_35]["resolverConfig.nameserver2"] or ""
      if L6_35 ~= #L5_34 then
        L0_29["Wan.DNS"] = L0_29["Wan.DNS"] .. ", "
        L0_29["Wan.SDNS"] = L0_29["Wan.SDNS"] .. ", "
      end
    end
  else
    L3_32 = db
    L3_32 = L3_32.getRowWhere
    L4_33 = "ipAddressTable"
    L5_34 = "LogicalIfName = '"
    L6_35 = logIfName
    L5_34 = L5_34 .. L6_35 .. L7_36 .. addressFamily
    L3_32 = L3_32(L4_33, L5_34)
    L1_30 = L3_32
    L3_32 = db
    L3_32 = L3_32.getRowWhere
    L4_33 = "defaultRouters"
    L5_34 = "LogicalIfName = '"
    L6_35 = logIfName
    L5_34 = L5_34 .. L6_35 .. L7_36 .. addressFamily
    L3_32 = L3_32(L4_33, L5_34)
    L4_33 = db
    L4_33 = L4_33.getRowWhere
    L5_34 = "resolverConfig"
    L6_35 = "LogicalIfName = '"
    L6_35 = L6_35 .. L7_36 .. "' and AddressFamily = " .. addressFamily
    L4_33 = L4_33(L5_34, L6_35)
    if L1_30 ~= nil then
      L5_34 = L1_30["ipAddressTable.ipAddress"]
      L0_29["Wan.IpAddr"] = L5_34
      L5_34 = L1_30["ipAddressTable.subnetMask"]
      L0_29["Wan.SnetMask"] = L5_34
    end
    if L3_32 ~= nil then
      L5_34 = L3_32["defaultRouters.nextHopGateway"]
      L0_29["Wan.Gateway"] = L5_34
    end
    if L4_33 ~= nil then
      L5_34 = L4_33["resolverConfig.nameserver1"]
      L0_29["Wan.DNS"] = L5_34
      L5_34 = L4_33["resolverConfig.nameserver2"]
      L0_29["Wan.SDNS"] = L5_34
    end
  end
  L3_32 = db
  L3_32 = L3_32.getAttribute
  L4_33 = "networkInterface"
  L5_34 = "LogicalIfName"
  L6_35 = logIfName
  L3_32 = L3_32(L4_33, L5_34, L6_35, L7_36)
  L3_32 = L3_32 or ""
  if L3_32 ~= "" then
    if L3_32 == "1" or L3_32 == "3" or L3_32 == "2" then
      L4_33 = logIfName
      if L4_33 == "WAN1" and L3_32 == "1" then
        L4_33 = addressFamily
        if L4_33 == "10" then
          L0_29["Wan.WanState"] = "DOWN"
        else
          L0_29["Wan.WanState"] = "UP"
        end
      else
        L4_33 = logIfName
        if L4_33 == "WAN1" and L3_32 == "2" then
          L4_33 = addressFamily
          if L4_33 == "2" then
            L0_29["Wan.WanState"] = "DOWN"
          else
            L0_29["Wan.WanState"] = "UP"
          end
        else
          L4_33 = logIfName
          if L4_33 == "WAN1" and L3_32 == "3" then
            L0_29["Wan.WanState"] = "UP"
          else
            L0_29["Wan.WanState"] = "UP"
          end
        end
      end
    elseif L3_32 == "0" then
      L0_29["Wan.WanState"] = "DOWN"
    end
  end
  return L0_29
end
function nimfView.wanStatusChange(A0_37)
  local L1_38, L2_39, L3_40, L4_41, L5_42
  L1_38 = ACCESS_LEVEL
  if L1_38 ~= 0 then
    L1_38 = "ACCESS_DENIED"
    L2_39 = "10187"
    return L1_38, L2_39
  end
  L1_38 = false
  L2_39 = db
  L2_39 = L2_39.getRowWhere
  L3_40 = "NimfConf"
  L4_41 = "LogicalIfName = '"
  L5_42 = logIfName
  L4_41 = L4_41 .. L5_42 .. "' and AddressFamily = " .. addressFamily
  L2_39 = L2_39(L3_40, L4_41)
  L3_40 = 1
  while L2_39 == nil and L3_40 <= 3 do
    L4_41 = db
    L4_41 = L4_41.getRowWhere
    L5_42 = "NimfConf"
    L4_41 = L4_41(L5_42, "LogicalIfName = '" .. logIfName .. "' and AddressFamily = " .. addressFamily)
    L2_39 = L4_41
    L3_40 = L3_40 + 1
  end
  if L2_39 == nil then
    L4_41 = "ERROR"
    L5_42 = "10993"
    return L4_41, L5_42
  end
  L4_41 = L2_39["NimfConf._ROWID_"]
  if L2_39 ~= nil then
    L5_42 = {}
    if A0_37 == "Enable" then
      L5_42["NimfConf.IfStatus"] = "1"
    elseif A0_37 == "Disable" then
      L5_42["NimfConf.IfStatus"] = "0"
    end
    L1_38 = nimf.config(L5_42, L4_41, "edit")
  end
  if L1_38 then
    L5_42 = db
    L5_42 = L5_42.commitTransaction
    L5_42(true)
    L5_42 = "OK"
    return L5_42, "12265"
  else
    L5_42 = db
    L5_42 = L5_42.rollback
    L5_42()
    L5_42 = "ERROR"
    return L5_42, "10992"
  end
end
function nimfView.dhcpStatusChange(A0_43)
  local L1_44, L2_45, L3_46, L4_47, L5_48
  L1_44 = ACCESS_LEVEL
  if L1_44 ~= 0 then
    L1_44 = "ACCESS_DENIED"
    L2_45 = "10187"
    return L1_44, L2_45
  end
  L1_44 = false
  L2_45 = db
  L2_45 = L2_45.getRowWhere
  L3_46 = "NimfConf"
  L4_47 = "LogicalIfName = '"
  L5_48 = logIfName
  L4_47 = L4_47 .. L5_48 .. "' and AddressFamily = " .. addressFamily
  L2_45 = L2_45(L3_46, L4_47)
  L3_46 = 1
  while L2_45 == nil and L3_46 <= 3 do
    L4_47 = db
    L4_47 = L4_47.getRowWhere
    L5_48 = "NimfConf"
    L4_47 = L4_47(L5_48, "LogicalIfName = '" .. logIfName .. "' and AddressFamily = " .. addressFamily)
    L2_45 = L4_47
    L3_46 = L3_46 + 1
  end
  if L2_45 == nil then
    L4_47 = "ERROR"
    L5_48 = "10993"
    return L4_47, L5_48
  end
  L4_47 = L2_45["NimfConf._ROWID_"]
  L5_48 = addressFamily
  if L5_48 == "10" then
    L1_44 = true
  else
    L5_48 = db
    L5_48 = L5_48.existsRowWhere
    L5_48 = L5_48("Dhcpc", "LogicalIfName = '" .. logIfName .. "'")
    if L5_48 then
      L5_48 = {}
      L5_48["Dhcpc.ReleaseLease"] = "1"
      L1_44 = dhcpc.config(L5_48, db.getAttribute("Dhcpc", "LogicalIfName", logIfName, "_ROWID_"), "edit")
    end
  end
  if L1_44 then
    if L2_45 ~= nil then
      if A0_43 == "release" then
        L5_48 = {}
        L5_48["NimfConf.IfStatus"] = "0"
        L1_44 = nimf.config(L5_48, L4_47, "edit")
      elseif A0_43 == "renew" then
        L5_48 = {}
        L5_48["NimfConf.IfStatus"] = "1"
        L1_44 = nimf.config(L5_48, L4_47, "edit")
      end
    else
      L1_44 = false
    end
  end
  if L1_44 then
    L5_48 = db
    L5_48 = L5_48.commitTransaction
    L5_48(true)
    L5_48 = "OK"
    return L5_48, "12265"
  else
    L5_48 = db
    L5_48 = L5_48.rollback
    L5_48()
    L5_48 = "ERROR"
    return L5_48, "10992"
  end
end
function nimfView.wanConfigGetWrap(A0_49)
  local L1_50, L2_51, L3_52
  logIfName = A0_49
  L1_50 = nimfView
  L1_50 = L1_50.wanConfigGet
  L1_50 = L1_50()
  L2_51 = nimfView
  L2_51 = L2_51.wanAdvConfigGet
  L2_51 = L2_51()
  L3_52 = {}
  if L1_50 ~= nil and L2_51 ~= nil then
    L3_52 = util.tableAppend(L1_50, L2_51)
  end
  return L3_52
end
function nimfView.wanConfigSetWrap(A0_53, A1_54, A2_55)
  local L3_56
  L3_56 = A0_53["NimfConf.LogicalIfName"]
  L3_56 = L3_56 or "WAN1"
  logIfName = L3_56
  L3_56 = A0_53["Wan.MyIpAddr"]
  if L3_56 ~= nil then
    L3_56 = util
    L3_56 = L3_56.split
    L3_56 = L3_56(A0_53["Wan.MyIpAddr"] or "", ".")
    A0_53["Wan.MyIpAddrbyte1"] = L3_56[1]
    A0_53["Wan.MyIpAddrbyte2"] = L3_56[2]
    A0_53["Wan.MyIpAddrbyte3"] = L3_56[3]
    A0_53["Wan.MyIpAddrbyte4"] = L3_56[4]
  end
  L3_56 = A0_53["Wan.IpAddr"]
  if L3_56 ~= nil then
    L3_56 = util
    L3_56 = L3_56.split
    L3_56 = L3_56(A0_53["Wan.IpAddr"] or "", ".")
    A0_53["Wan.IpAddrbyte1"] = L3_56[1]
    A0_53["Wan.IpAddrbyte2"] = L3_56[2]
    A0_53["Wan.IpAddrbyte3"] = L3_56[3]
    A0_53["Wan.IpAddrbyte4"] = L3_56[4]
  end
  L3_56 = A0_53["Wan.SnetMask"]
  if L3_56 ~= nil then
    L3_56 = util
    L3_56 = L3_56.split
    L3_56 = L3_56(A0_53["Wan.SnetMask"] or "", ".")
    A0_53["Wan.SnetMaskbyte1"] = L3_56[1]
    A0_53["Wan.SnetMaskbyte2"] = L3_56[2]
    A0_53["Wan.SnetMaskbyte3"] = L3_56[3]
    A0_53["Wan.SnetMaskbyte4"] = L3_56[4]
  end
  L3_56 = A0_53["Wan.GwIpAddr"]
  if L3_56 ~= nil then
    L3_56 = util
    L3_56 = L3_56.split
    L3_56 = L3_56(A0_53["Wan.GwIpAddr"] or "", ".")
    A0_53["Wan.GwIpAddrbyte1"] = L3_56[1]
    A0_53["Wan.GwIpAddrbyte2"] = L3_56[2]
    A0_53["Wan.GwIpAddrbyte3"] = L3_56[3]
    A0_53["Wan.GwIpAddrbyte4"] = L3_56[4]
  end
  L3_56 = A0_53["Wan.PriDnsIpAddr"]
  if L3_56 ~= nil then
    L3_56 = util
    L3_56 = L3_56.split
    L3_56 = L3_56(A0_53["Wan.PriDnsIpAddr"] or "", ".")
    A0_53["Wan.PriDnsIpAddrbyte1"] = L3_56[1]
    A0_53["Wan.PriDnsIpAddrbyte2"] = L3_56[2]
    A0_53["Wan.PriDnsIpAddrbyte3"] = L3_56[3]
    A0_53["Wan.PriDnsIpAddrbyte4"] = L3_56[4]
  end
  L3_56 = A0_53["Wan.SecDnsIpAddr"]
  if L3_56 ~= nil then
    L3_56 = A0_53["Wan.SecDnsIpAddr"]
    if L3_56 ~= "" then
      L3_56 = util
      L3_56 = L3_56.split
      L3_56 = L3_56(A0_53["Wan.SecDnsIpAddr"] or "", ".")
      A0_53["Wan.SecDnsIpAddrbyte1"] = L3_56[1]
      A0_53["Wan.SecDnsIpAddrbyte2"] = L3_56[2]
      A0_53["Wan.SecDnsIpAddrbyte3"] = L3_56[3]
      A0_53["Wan.SecDnsIpAddrbyte4"] = L3_56[4]
    end
  else
    L3_56 = A0_53["Wan.SecDnsIpAddr"]
    if L3_56 == "" then
      A0_53["Wan.SecDnsIpAddrbyte1"] = ""
      A0_53["Wan.SecDnsIpAddrbyte2"] = ""
      A0_53["Wan.SecDnsIpAddrbyte3"] = ""
      A0_53["Wan.SecDnsIpAddrbyte4"] = ""
    end
  end
  L3_56 = A0_53["Wan.UseMac"]
  if L3_56 == "2" then
    L3_56 = A0_53["Wan.MacAddr"]
    if L3_56 == "00:00:00:00:00:00" or string.upper(L3_56) == "FF:FF:FF:FF:FF:FF" then
      return "ERROR", "11335"
    end
    if string.sub(L3_56, 2, 2) == "1" or string.sub(L3_56, 2, 2) == "3" or string.sub(L3_56, 2, 2) == "5" or string.sub(L3_56, 2, 2) == "7" or string.sub(L3_56, 2, 2) == "9" or string.sub(L3_56, 2, 2) == "b" or string.sub(L3_56, 2, 2) == "d" or string.sub(L3_56, 2, 2) == "f" or string.sub(L3_56, 2, 2) == "B" or string.sub(L3_56, 2, 2) == "D" or string.sub(L3_56, 2, 2) == "F" then
      return "ERROR", "11327"
    end
  end
  L3_56 = nimfView
  L3_56 = L3_56.config
  return L3_56(A0_53, A1_54, A2_55)
end
function nimfView.wanStatusChangeWrap(A0_57, A1_58, A2_59)
  logIfName = A1_58 or "WAN1"
  addressFamily = A2_59 or "2"
  return nimfView.wanStatusChange(A0_57)
end
function nimfView.dhcpStatusChangeWrap(A0_60, A1_61, A2_62)
  logIfName = A1_61 or "WAN1"
  addressFamily = A2_62 or "2"
  return nimfView.dhcpStatusChange(A0_60)
end
function nimfView.wanStatusGetWrap(A0_63, A1_64)
  logIfName = A0_63 or "WAN1"
  addressFamily = A1_64 or "2"
  return nimfView.wanStatusGet()
end
function nimfView.portModeConfig(A0_65, A1_66, A2_67)
  local L3_68, L4_69, L5_70, L6_71, L7_72, L8_73
  L3_68 = ACCESS_LEVEL
  if L3_68 ~= 0 then
    L3_68 = "ACCESS_DENIED"
    L4_69 = "10187"
    return L3_68, L4_69
  end
  L3_68 = db
  L3_68 = L3_68.beginTransaction
  L3_68()
  L3_68 = false
  L4_69 = db
  L4_69 = L4_69.getAttribute
  L5_70 = "unitName"
  L6_71 = "_ROWID_"
  L7_72 = "1"
  L8_73 = "unitName"
  L4_69 = L4_69(L5_70, L6_71, L7_72, L8_73)
  L5_70 = db
  L5_70 = L5_70.getAttribute
  L6_71 = "unitInfo"
  L7_72 = "_ROWID_"
  L8_73 = "1"
  L5_70 = L5_70(L6_71, L7_72, L8_73, "modelId")
  if L4_69 ~= nil and L4_69 ~= "WRVS5110" or L5_70 ~= nil and (L5_70 == "DSR-250" or L5_70 == "DSR-250N" or L5_70 == "DSR-150" or L5_70 == "DSR-150N") then
    L4_69 = true
  else
    L4_69 = false
  end
  if L4_69 then
    L6_71 = A0_65["ConfigPort.LogicalIfName"]
    if L6_71 ~= nil then
      L6_71 = A0_65["ConfigPort.LogicalIfName"]
      if L6_71 ~= "LAN" then
        if L5_70 ~= nil and (L5_70 == "DSR-250" or L5_70 == "DSR-250N" or L5_70 == "DSR-150" or L5_70 == "DSR-150N") then
          L6_71 = db
          L6_71 = L6_71.existsRow
          L7_72 = "vlan"
          L8_73 = "vlanId"
          L6_71 = L6_71(L7_72, L8_73, "4093")
          if L6_71 then
            L7_72 = db
            L7_72 = L7_72.rollback
            L7_72()
            L7_72 = "ERROR"
            L8_73 = "20547"
            return L7_72, L8_73
          end
          L7_72 = db
          L7_72 = L7_72.getRowsWhere
          L8_73 = "VlanPortMgmt"
          L7_72 = L7_72(L8_73, "DefaultPVID = 4093 and PortName != 'OptionalPort'")
          L8_73 = #L7_72
          if L8_73 ~= 0 then
            L8_73 = db
            L8_73 = L8_73.rollback
            L8_73()
            L8_73 = "ERROR"
            return L8_73, "20548"
          end
        else
          L6_71 = db
          L6_71 = L6_71.existsRow
          L7_72 = "vlan"
          L8_73 = "vlanId"
          L6_71 = L6_71(L7_72, L8_73, "4094")
          if L6_71 then
            L7_72 = db
            L7_72 = L7_72.rollback
            L7_72()
            L7_72 = "ERROR"
            L8_73 = "12503"
            return L7_72, L8_73
          end
          L7_72 = db
          L7_72 = L7_72.getRowsWhere
          L8_73 = "VlanPortMgmt"
          L7_72 = L7_72(L8_73, "DefaultPVID = 4094 and PortName != 'OptionalPort'")
          L8_73 = #L7_72
          if L8_73 ~= 0 then
            L8_73 = db
            L8_73 = L8_73.rollback
            L8_73()
            L8_73 = "ERROR"
            return L8_73, "11892"
          end
        end
        L3_68 = true
      end
    end
  else
    L3_68 = true
  end
  if L5_70 ~= nil and (L5_70 == "DSR-250" or L5_70 == "DSR-250N" or L5_70 == "DSR-150" or L5_70 == "DSR-150N") then
    L6_71 = 5
    optPortRowid = L6_71
  else
    L6_71 = 3
    optPortRowid = L6_71
  end
  L6_71 = 2
  L7_72 = A0_65["ConfigPort.LogicalIfName"]
  if L7_72 == "DMZ" then
    L6_71 = 4
  else
    L7_72 = A0_65["ConfigPort.LogicalIfName"]
    if L7_72 == "LAN" then
      L6_71 = 1
    end
  end
  if L3_68 then
    L7_72 = db
    L7_72 = L7_72.existsRow
    L8_73 = "ConfigPort"
    L7_72 = L7_72(L8_73, "_ROWID_", A1_66)
    if L7_72 then
      L8_73 = {}
      L8_73["DefaultIfGrpInfo.LogicalIfName"] = A0_65["ConfigPort.LogicalIfName"]
      L8_73["DefaultIfGrpInfo.IfGroupId"] = L6_71
      L3_68 = db.update("DefaultIfGrpInfo", L8_73, optPortRowid)
      L3_68 = L3_68 and db.update("ConfigPort", A0_65, A1_66)
    else
      L8_73 = db
      L8_73 = L8_73.insert
      L8_73 = L8_73("ConfigPort", A0_65)
      L3_68 = L8_73
    end
  end
  L7_72 = db
  L7_72 = L7_72.getRow
  L8_73 = "dhcp"
  L7_72 = L7_72(L8_73, "logicalIfName", "DMZ")
  if L3_68 and L7_72 ~= nil then
    L8_73 = A0_65["ConfigPort.LogicalIfName"]
    if L8_73 ~= "DMZ" then
      L8_73 = L7_72["dhcp.dhcpEnabled"]
      if L8_73 == "1" then
        L7_72["dhcp.oldState"] = "1"
        L7_72["dhcp.dhcpEnabled"] = "0"
      end
    else
      L8_73 = A0_65["ConfigPort.LogicalIfName"]
      if L8_73 == "DMZ" then
        L8_73 = L7_72["dhcp.oldState"]
        if L8_73 == "1" then
          L8_73 = db
          L8_73 = L8_73.getRowWhere
          L8_73 = L8_73("ifStatic", "LogicalIfName = 'DMZ' and AddressFamily = 2")
          if L8_73 ~= nil then
            db.setAttribute("ifStatic", "_ROWID_", L8_73["ifStatic._ROWID_"], "LogicalIfName", L8_73["ifStatic.LogicalIfName"])
          end
          L7_72["dhcp.oldState"] = "0"
          L7_72["dhcp.dhcpEnabled"] = "1"
        end
      end
    end
    L8_73 = db
    L8_73 = L8_73.update
    L8_73 = L8_73("dhcp", L7_72, L7_72["dhcp._ROWID_"])
    L3_68 = L8_73
  end
  if L3_68 then
    L8_73 = db
    L8_73 = L8_73.commitTransaction
    L8_73(true)
    L8_73 = "OK"
    return L8_73, "12265"
  else
    L8_73 = db
    L8_73 = L8_73.rollback
    L8_73()
    L8_73 = "ERROR"
    return L8_73, "12780"
  end
end
function nimfView.wanModeConfig(A0_74, A1_75, A2_76)
  local L3_77, L4_78, L5_79, L6_80, L7_81, L8_82
  L3_77 = ACCESS_LEVEL
  if L3_77 ~= 0 then
    L3_77 = "ACCESS_DENIED"
    L4_78 = "10187"
    return L3_77, L4_78
  end
  L3_77 = A0_74["WanMode.Wanmode"]
  if L3_77 ~= nil then
    L3_77 = A0_74["WanMode.Wanmode"]
    if L3_77 == "1" then
      L3_77 = db
      L3_77 = L3_77.getRowWhere
      L4_78 = "NimfConf"
      L5_79 = "LogicalIfName = 'WAN1' AND  AddressFamily = 2"
      L3_77 = L3_77(L4_78, L5_79)
      L4_78 = L3_77["NimfConf.ConnectionType"]
      if L4_78 == "l2tp" or L4_78 == "pptp" then
        L5_79 = db
        L5_79 = L5_79.getAttribute
        L6_80 = L4_78
        L7_81 = "LogicalIfName"
        L8_82 = "WAN1"
        L5_79 = L5_79(L6_80, L7_81, L8_82, "IdleTimeOutFlag")
        idle1 = L5_79
      elseif L4_78 == "pppoe" then
        L5_79 = db
        L5_79 = L5_79.getAttribute
        L6_80 = "pppoe"
        L7_81 = "LogicalIfName"
        L8_82 = "WAN1"
        L5_79 = L5_79(L6_80, L7_81, L8_82, "ProfileName")
        profile1 = L5_79
        L5_79 = db
        L5_79 = L5_79.getAttribute
        L6_80 = "PppoeProfile"
        L7_81 = "ProfileName"
        L8_82 = profile1
        L5_79 = L5_79(L6_80, L7_81, L8_82, "IdleTimeOutFlag")
        idle1 = L5_79
      else
        L5_79 = "0"
        idle1 = L5_79
      end
      L5_79 = db
      L5_79 = L5_79.getRowWhere
      L6_80 = "NimfConf"
      L7_81 = "LogicalIfName = 'WAN2' AND  AddressFamily = 2"
      L5_79 = L5_79(L6_80, L7_81)
      L6_80 = L5_79["NimfConf.ConnectionType"]
      if L6_80 == "l2tp" or L6_80 == "pptp" then
        L7_81 = db
        L7_81 = L7_81.getAttribute
        L8_82 = L6_80
        L7_81 = L7_81(L8_82, "LogicalIfName", "WAN2", "IdleTimeOutFlag")
        idle2 = L7_81
      elseif L6_80 == "pppoe" then
        L7_81 = db
        L7_81 = L7_81.getAttribute
        L8_82 = "pppoe"
        L7_81 = L7_81(L8_82, "LogicalIfName", "WAN2", "ProfileName")
        profile2 = L7_81
        L7_81 = db
        L7_81 = L7_81.getAttribute
        L8_82 = "PppoeProfile"
        L7_81 = L7_81(L8_82, "ProfileName", profile2, "IdleTimeOutFlag")
        idle2 = L7_81
      else
        L7_81 = "0"
        idle2 = L7_81
      end
      L7_81 = db
      L7_81 = L7_81.getRowWhere
      L8_82 = "NimfConf"
      L7_81 = L7_81(L8_82, "LogicalIfName = 'WAN3' AND  AddressFamily = 2")
      L7_81 = L7_81 or ""
      L8_82 = L7_81["NimfConf.ConnectionType"]
      L8_82 = L8_82 or ""
      if L8_82 == "l2tp" or L8_82 == "pptp" then
        idle3 = db.getAttribute(L8_82, "LogicalIfName", "WAN3", "IdleTimeOutFlag")
      elseif L8_82 == "pppoe" then
        profile3 = db.getAttribute("pppoe", "LogicalIfName", "WAN3", "ProfileName")
        idle3 = db.getAttribute("PppoeProfile", "ProfileName", profile3, "IdleTimeOutFlag")
      else
        idle3 = "0"
      end
      if idle1 == "1" or idle2 == "1" or idle3 == "1" then
        return "ERROR", "11758"
      end
    end
  end
  L3_77 = db
  L3_77 = L3_77.beginTransaction
  L3_77()
  L3_77 = false
  L4_78 = db
  L4_78 = L4_78.existsRow
  L5_79 = "WanMode"
  L6_80 = "_ROWID_"
  L7_81 = "1"
  L4_78 = L4_78(L5_79, L6_80, L7_81)
  if L4_78 then
    L4_78 = db
    L4_78 = L4_78.update
    L5_79 = "WanMode"
    L6_80 = A0_74
    L7_81 = A1_75
    L4_78 = L4_78(L5_79, L6_80, L7_81)
    L3_77 = L4_78
  else
    L4_78 = db
    L4_78 = L4_78.insert
    L5_79 = "WanMode"
    L6_80 = A0_74
    L4_78 = L4_78(L5_79, L6_80)
    L3_77 = L4_78
  end
  L4_78 = {}
  L4_78["WanFailure.LogicalIfName"] = "WAN1"
  L4_78["WanFailure.AddressFamily"] = "2"
  L5_79 = A0_74["WanFailure.PingIp"]
  L4_78["WanFailure.PingIp"] = L5_79
  L5_79 = A0_74["WanFailure.DnsIp"]
  L4_78["WanFailure.DnsIp"] = L5_79
  if L3_77 then
    L5_79 = db
    L5_79 = L5_79.existsRow
    L6_80 = "WanFailure"
    L7_81 = "LogicalIfName"
    L8_82 = "WAN1"
    L5_79 = L5_79(L6_80, L7_81, L8_82)
    if L5_79 then
      L5_79 = db
      L5_79 = L5_79.getAttribute
      L6_80 = "WanFailure"
      L7_81 = "LogicalIfName"
      L8_82 = "WAN1"
      L5_79 = L5_79(L6_80, L7_81, L8_82, "_ROWID_")
      L6_80 = db
      L6_80 = L6_80.update
      L7_81 = "WanFailure"
      L8_82 = L4_78
      L6_80 = L6_80(L7_81, L8_82, L5_79)
      L3_77 = L6_80
    else
      L5_79 = db
      L5_79 = L5_79.insert
      L6_80 = "WanFailure"
      L7_81 = L4_78
      L5_79 = L5_79(L6_80, L7_81)
      L3_77 = L5_79
    end
  end
  L5_79 = {}
  L4_78 = L5_79
  L4_78["WanFailure.LogicalIfName"] = "WAN2"
  L4_78["WanFailure.AddressFamily"] = "2"
  L5_79 = A0_74["WanFailure.PingIp1"]
  L4_78["WanFailure.PingIp"] = L5_79
  L5_79 = A0_74["WanFailure.DnsIp1"]
  L4_78["WanFailure.DnsIp"] = L5_79
  if L3_77 then
    L5_79 = db
    L5_79 = L5_79.existsRow
    L6_80 = "WanFailure"
    L7_81 = "LogicalIfName"
    L8_82 = "WAN2"
    L5_79 = L5_79(L6_80, L7_81, L8_82)
    if L5_79 then
      L5_79 = db
      L5_79 = L5_79.getAttribute
      L6_80 = "WanFailure"
      L7_81 = "LogicalIfName"
      L8_82 = "WAN2"
      L5_79 = L5_79(L6_80, L7_81, L8_82, "_ROWID_")
      L6_80 = db
      L6_80 = L6_80.update
      L7_81 = "WanFailure"
      L8_82 = L4_78
      L6_80 = L6_80(L7_81, L8_82, L5_79)
      L3_77 = L6_80
    else
      L5_79 = db
      L5_79 = L5_79.insert
      L6_80 = "WanFailure"
      L7_81 = L4_78
      L5_79 = L5_79(L6_80, L7_81)
      L3_77 = L5_79
    end
  end
  L5_79 = {}
  L4_78 = L5_79
  L4_78["WanFailure.LogicalIfName"] = "WAN3"
  L4_78["WanFailure.AddressFamily"] = "2"
  L5_79 = A0_74["WanFailure.PingIp2"]
  L4_78["WanFailure.PingIp"] = L5_79
  L5_79 = A0_74["WanFailure.DnsIp2"]
  L4_78["WanFailure.DnsIp"] = L5_79
  if L3_77 then
    L5_79 = db
    L5_79 = L5_79.existsRow
    L6_80 = "WanFailure"
    L7_81 = "LogicalIfName"
    L8_82 = "WAN3"
    L5_79 = L5_79(L6_80, L7_81, L8_82)
    if L5_79 then
      L5_79 = db
      L5_79 = L5_79.getAttribute
      L6_80 = "WanFailure"
      L7_81 = "LogicalIfName"
      L8_82 = "WAN3"
      L5_79 = L5_79(L6_80, L7_81, L8_82, "_ROWID_")
      L6_80 = db
      L6_80 = L6_80.update
      L7_81 = "WanFailure"
      L8_82 = L4_78
      L6_80 = L6_80(L7_81, L8_82, L5_79)
      L3_77 = L6_80
    else
      L5_79 = db
      L5_79 = L5_79.insert
      L6_80 = "WanFailure"
      L7_81 = L4_78
      L5_79 = L5_79(L6_80, L7_81)
      L3_77 = L5_79
    end
  end
  if L3_77 then
    L5_79 = db
    L5_79 = L5_79.commitTransaction
    L6_80 = true
    L5_79(L6_80)
    L5_79 = "OK"
    L6_80 = "12265"
    return L5_79, L6_80
  else
    L5_79 = db
    L5_79 = L5_79.rollback
    L5_79()
    L5_79 = "ERROR"
    L6_80 = "12781"
    return L5_79, L6_80
  end
end
function nimfView.wanMode6Config(A0_83, A1_84, A2_85)
  local L3_86
  L3_86 = ACCESS_LEVEL
  if L3_86 ~= 0 then
    L3_86 = "ACCESS_DENIED"
    return L3_86, "10187"
  end
  L3_86 = db
  L3_86 = L3_86.beginTransaction
  L3_86()
  L3_86 = false
  if A0_83["WanMode.Wanmode"] ~= nil and A0_83["WanMode.Wanmode"] == "2" then
    if A0_83["WanMode.FailoverPriLogicalIfName"] ~= nil and A0_83["WanMode.FailoverPriLogicalIfName"] == "WAN1" then
      A0_83["WanMode.FailoverSecLogicalIfName"] = "WAN2"
    elseif A0_83["WanMode.FailoverPriLogicalIfName"] ~= nil and A0_83["WanMode.FailoverPriLogicalIfName"] == "WAN2" then
      A0_83["WanMode.FailoverSecLogicalIfName"] = "WAN1"
    end
  end
  if db.existsRow("WanMode", "_ROWID_", "2") then
    L3_86 = db.update("WanMode", A0_83, A1_84)
  else
    L3_86 = db.insert("WanMode", A0_83)
  end
  if L3_86 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12781"
  end
end
function nimfView.protocolBindingConfig(A0_87, A1_88, A2_89)
end
function nimfView.ipv6WanConfig(A0_90, A1_91, A2_92)
  local L3_93, L4_94, L5_95, L6_96, L7_97
  L3_93 = ACCESS_LEVEL
  if L3_93 ~= 0 then
    L3_93 = "ACCESS_DENIED"
    L4_94 = "10187"
    return L3_93, L4_94
  end
  L3_93 = A0_90["NimfConf.LogicalIfName"]
  logIfName = L3_93
  L3_93 = "LogicalIfName = '"
  L4_94 = logIfName
  L5_95 = "' AND AddressFamily = 10"
  L3_93 = L3_93 .. L4_94 .. L5_95
  L4_94 = db
  L4_94 = L4_94.getRowWhere
  L5_95 = "NimfConf"
  L6_96 = L3_93
  L4_94 = L4_94(L5_95, L6_96)
  if L4_94 == nil then
    L5_95 = "ERROR"
    L6_96 = "10993"
    return L5_95, L6_96
  end
  A1_91 = L4_94["NimfConf._ROWID_"]
  L5_95 = db
  L5_95 = L5_95.beginTransaction
  L5_95()
  L5_95 = false
  L6_96 = {}
  L7_97 = logIfName
  L6_96["NimfConf.LogicalIfName"] = L7_97
  L6_96["NimfConf.AddressFamily"] = "10"
  L7_97 = A0_90["NimfConf.ConnectionType6"]
  if L7_97 == "dhcp6c" then
    L6_96["NimfConf.ConnectionType6"] = "dhcp6c"
    L7_97 = logIfName
    A0_90["dhcpv6c.LogicalIfName"] = L7_97
    L7_97 = db
    L7_97 = L7_97.existsRowWhere
    L7_97 = L7_97("dhcpv6c", "LogicalIfName='" .. logIfName .. "'")
    if L7_97 then
      L7_97 = nimfView
      L7_97 = L7_97.dhcp6Config
      L7_97 = L7_97(A0_90, db.existsRowWhere("dhcpv6c", "LogicalIfName='" .. logIfName .. "'"), "edit")
      L5_95 = L7_97
    else
      L7_97 = nimfView
      L7_97 = L7_97.dhcp6Config
      L7_97 = L7_97(A0_90, "-1", "add")
      L5_95 = L7_97
    end
  else
    L7_97 = A0_90["NimfConf.ConnectionType6"]
    if L7_97 == "pppoe6" then
      L6_96["NimfConf.ConnectionType6"] = "pppoe6"
      L7_97 = logIfName
      A0_90["Pppoe6.LogicalIfName"] = L7_97
      L7_97 = db
      L7_97 = L7_97.existsRowWhere
      L7_97 = L7_97("Pppoe6", "LogicalIfName='" .. logIfName .. "'")
      if L7_97 then
        L7_97 = nimfView
        L7_97 = L7_97.pppoe6Config
        L7_97 = L7_97(A0_90, db.existsRowWhere("Pppoe6", "LogicalIfName='" .. logIfName .. "'"), "edit")
        L5_95 = L7_97
      else
        L7_97 = nimfView
        L7_97 = L7_97.pppoe6Config
        L7_97 = L7_97(A0_90, "-1", "add")
        L5_95 = L7_97
      end
      L7_97 = db
      L7_97 = L7_97.existsRowWhere
      L7_97 = L7_97("dhcpv6c", "LogicalIfName='" .. logIfName .. "PPPOE6'")
      if L7_97 then
        L7_97 = {}
        if A0_90["Pppoe6.Dhcpv6Opt"] == "1" then
          L7_97["dhcpv6c.statelessMode"] = "1"
          L7_97["dhcpv6c.prefixDelegation"] = "0"
        elseif A0_90["Pppoe6.Dhcpv6Opt"] == "2" then
          L7_97["dhcpv6c.statelessMode"] = "0"
          L7_97["dhcpv6c.prefixDelegation"] = "0"
        elseif A0_90["Pppoe6.Dhcpv6Opt"] == "3" then
          L7_97["dhcpv6c.statelessMode"] = "1"
          L7_97["dhcpv6c.prefixDelegation"] = "1"
        end
        if L7_97 ~= nil then
          L5_95 = nimfView.dhcp6Config(L7_97, db.existsRowWhere("dhcpv6c", "LogicalIfName='" .. logIfName .. "PPPOE6'"), "edit")
        end
      end
    else
      L6_96["NimfConf.ConnectionType6"] = "ifStatic6"
      L7_97 = logIfName
      A0_90["ifStatic.LogicalIfName"] = L7_97
      A0_90["ifStatic.AddressFamily"] = "10"
      L7_97 = db
      L7_97 = L7_97.existsRowWhere
      L7_97 = L7_97("ifStatic", L3_93)
      if L7_97 then
        L7_97 = ifStatic
        L7_97 = L7_97.config
        L7_97 = L7_97(A0_90, db.existsRowWhere("ifStatic", L3_93), "edit")
        L5_95 = L7_97
      else
        L7_97 = ifStatic
        L7_97 = L7_97.config
        L7_97 = L7_97(A0_90, "-1", "add")
        L5_95 = L7_97
      end
    end
  end
  if L5_95 then
    L7_97 = nimf
    L7_97 = L7_97.config
    L7_97 = L7_97(L6_96, A1_91, "edit")
    L5_95 = L7_97
  end
  if L5_95 then
    L7_97 = db
    L7_97 = L7_97.commitTransaction
    L7_97(true)
    L7_97 = "OK"
    return L7_97, "12265"
  else
    L7_97 = db
    L7_97 = L7_97.rollback
    L7_97()
    L7_97 = "ERROR"
    return L7_97, "11162"
  end
end
function nimfView.ipv6WanConfigGet(A0_98)
  local L1_99
  logIfName = A0_98
  L1_99 = {}
  if db.getRowWhere("NimfConf", "LogicalIfName = '" .. logIfName .. "' AND AddressFamily=10") ~= nil then
    L1_99["NimfConf.ConnectionType6"] = db.getRowWhere("NimfConf", "LogicalIfName = '" .. logIfName .. "' AND AddressFamily=10")["NimfConf.ConnectionType6"]
    if db.getRowWhere("dhcpv6c", "LogicalIfName = '" .. logIfName .. "'") ~= nil then
      L1_99["dhcpv6c.statelessMode"] = db.getRowWhere("dhcpv6c", "LogicalIfName = '" .. logIfName .. "'")["dhcpv6c.statelessMode"]
      L1_99["dhcpv6c.requestPreferredAddress"] = db.getRowWhere("dhcpv6c", "LogicalIfName = '" .. logIfName .. "'")["dhcpv6c.requestPreferredAddress"]
      L1_99["dhcpv6c.preferredAddress"] = db.getRowWhere("dhcpv6c", "LogicalIfName = '" .. logIfName .. "'")["dhcpv6c.preferredAddress"]
      L1_99["dhcpv6c.preferredAddressPrefixLength"] = db.getRowWhere("dhcpv6c", "LogicalIfName = '" .. logIfName .. "'")["dhcpv6c.preferredAddressPrefixLength"]
      L1_99["dhcpv6c.prefixDelegation"] = db.getRowWhere("dhcpv6c", "LogicalIfName = '" .. logIfName .. "'")["dhcpv6c.prefixDelegation"]
    end
    if db.getRowWhere("ifStatic", "LogicalIfName = '" .. logIfName .. "' AND AddressFamily=10") ~= nil then
      L1_99["ifStatic.StaticIp"] = db.getRowWhere("ifStatic", "LogicalIfName = '" .. logIfName .. "' AND AddressFamily=10")["ifStatic.StaticIp"]
      L1_99["ifStatic.PrefixLength"] = db.getRowWhere("ifStatic", "LogicalIfName = '" .. logIfName .. "' AND AddressFamily=10")["ifStatic.PrefixLength"]
      L1_99["ifStatic.Gateway"] = db.getRowWhere("ifStatic", "LogicalIfName = '" .. logIfName .. "' AND AddressFamily=10")["ifStatic.Gateway"]
      L1_99["ifStatic.PrimaryDns"] = db.getRowWhere("ifStatic", "LogicalIfName = '" .. logIfName .. "' AND AddressFamily=10")["ifStatic.PrimaryDns"]
      L1_99["ifStatic.SecondaryDns"] = db.getRowWhere("ifStatic", "LogicalIfName = '" .. logIfName .. "' AND AddressFamily=10")["ifStatic.SecondaryDns"]
    end
    if db.getRowWhere("Pppoe6", "LogicalIfName = '" .. logIfName .. "'") ~= nil then
      L1_99["Pppoe6.UserName"] = db.getRowWhere("Pppoe6", "LogicalIfName = '" .. logIfName .. "'")["Pppoe6.UserName"]
      L1_99["Pppoe6.Password"] = db.getRowWhere("Pppoe6", "LogicalIfName = '" .. logIfName .. "'")["Pppoe6.Password"]
      L1_99["Pppoe6.AuthOpt"] = db.getRowWhere("Pppoe6", "LogicalIfName = '" .. logIfName .. "'")["Pppoe6.AuthOpt"]
      L1_99["Pppoe6.Dhcpv6Opt"] = db.getRowWhere("Pppoe6", "LogicalIfName = '" .. logIfName .. "'")["Pppoe6.Dhcpv6Opt"]
      L1_99["Pppoe6.PrimaryDns"] = db.getRowWhere("Pppoe6", "LogicalIfName = '" .. logIfName .. "'")["Pppoe6.PrimaryDns"]
      L1_99["Pppoe6.SecondaryDns"] = db.getRowWhere("Pppoe6", "LogicalIfName = '" .. logIfName .. "'")["Pppoe6.SecondaryDns"]
    end
  end
  return L1_99
end
function nimfView.dhcp6Config(A0_100, A1_101, A2_102)
  if db.typeAndRangeValidate(A0_100) then
    if A2_102 == "add" then
      return db.insert("dhcpv6c", A0_100)
    elseif A2_102 == "edit" then
      return db.update("dhcpv6c", A0_100, A1_101)
    elseif A2_102 == "delete" then
      return nil
    end
  end
  return false
end
function nimfView.pppoe6Config(A0_103, A1_104, A2_105)
  if db.typeAndRangeValidate(A0_103) then
    if A2_105 == "add" then
      return db.insert("Pppoe6", A0_103)
    elseif A2_105 == "edit" then
      return db.update("Pppoe6", A0_103, A1_104)
    elseif A2_105 == "delete" then
      return nil
    end
  end
  return false
end
function nimfView.ipModeConfig(A0_106, A1_107, A2_108)
  local L3_109, L4_110
  L3_109 = ACCESS_LEVEL
  if L3_109 ~= 0 then
    L3_109 = "ACCESS_DENIED"
    L4_110 = "10187"
    return L3_109, L4_110
  end
  L3_109 = db
  L3_109 = L3_109.beginTransaction
  L3_109()
  L3_109 = false
  L4_110 = tonumber
  L4_110 = L4_110(A0_106["networkInfo.netWorkMode"])
  if L4_110 == 1 then
    L4_110 = "PppoeSessions = "
    L4_110 = L4_110 .. _UPVALUE0_ .. ""
    val = db.setAttributeWhere(pppoe6Table, L4_110, _UPVALUE1_.pppoeSessions, _UPVALUE2_)
    if val == nil then
      printCLIError("Failed to change the session the IPV6 " .. "PPPoE session.")
      return "ERROR"
    end
    db.setAttribute(vlanTable, "_ROWID_", "1", _UPVALUE1_.vlanIPv6, DISABLE)
  else
    L4_110 = db
    L4_110 = L4_110.setAttribute
    L4_110(vlanTable, "_ROWID_", "1", _UPVALUE1_.vlanIPv6, ENABLE)
  end
  L4_110 = db
  L4_110 = L4_110.existsRow
  L4_110 = L4_110("networkInfo", "_ROWID_", A1_107)
  if L4_110 then
    L3_109 = db.update("networkInfo", A0_106, A1_107)
  else
    L3_109 = db.insert("networkInfo", A0_106)
  end
  if L3_109 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "11084"
  end
end
function nimfView.sixtoFourTunnelConfig(A0_111, A1_112, A2_113)
  local L3_114
  L3_114 = ACCESS_LEVEL
  if L3_114 ~= 0 then
    L3_114 = "ACCESS_DENIED"
    return L3_114, "10187"
  end
  L3_114 = db
  L3_114 = L3_114.beginTransaction
  L3_114()
  L3_114 = false
  if db.existsRow("sixToFourTunnel", "_ROWID_", A1_112) then
    L3_114 = db.update("sixToFourTunnel", A0_111, A1_112)
  else
    L3_114 = db.insert("sixToFourTunnel", A0_111)
  end
  if L3_114 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "10128"
  end
end
function nimfView.isatapTunnelDelete(A0_115)
  local L1_116, L2_117, L3_118, L4_119, L5_120, L6_121, L7_122
  L1_116 = ACCESS_LEVEL
  if L1_116 ~= 0 then
    L1_116 = "ACCESS_DENIED"
    return L1_116, L2_117
  end
  L1_116 = db
  L1_116 = L1_116.beginTransaction
  L1_116()
  L1_116 = false
  for L5_120, L6_121 in L2_117(L3_118) do
    L7_122 = {}
    L7_122["isatapTunnel._ROWID_"] = L6_121
    L1_116 = db.delete("isatapTunnel", L7_122)
    if L1_116 == false then
      break
    end
  end
  if L1_116 then
    L2_117(L3_118)
    return L2_117, L3_118
  else
    L2_117()
    return L2_117, L3_118
  end
end
function nimfView.isatapTunnelConfig(A0_123, A1_124, A2_125)
  local L3_126
  L3_126 = ACCESS_LEVEL
  if L3_126 ~= 0 then
    L3_126 = "ACCESS_DENIED"
    return L3_126, "10187"
  end
  L3_126 = db
  L3_126 = L3_126.beginTransaction
  L3_126()
  L3_126 = false
  A0_123["isatapTunnel.transportIfName"] = "LAN"
  if A0_123["isatapTunnel.useLanAddress"] == "1" then
    A0_123["isatapTunnel.localIPv4Address"] = ""
  end
  if db.typeAndRangeValidate(A0_123) then
    if A2_125 == "add" then
      L3_126 = db.insert(DBTable, A0_123)
    elseif A2_125 == "edit" then
      L3_126 = db.update(DBTable, A0_123, A1_124)
    elseif A2_125 == "delete" then
      L3_126 = db.delete(DBTable, A0_123)
    end
  end
  if L3_126 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "11166"
  end
end
function nimfView.ipv6MldConfig(A0_127, A1_128, A2_129)
  local L3_130
  L3_130 = ACCESS_LEVEL
  if L3_130 ~= 0 then
    L3_130 = "ACCESS_DENIED"
    return L3_130, "10187"
  end
  L3_130 = db
  L3_130 = L3_130.beginTransaction
  L3_130()
  L3_130 = false
  if db.existsRow("mldproxy", "_ROWID_", A1_128) then
    L3_130 = db.update("mldproxy", A0_127, A1_128)
  else
    L3_130 = db.insert("mldproxy", A0_127)
  end
  if L3_130 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12783"
  end
end
function nimfView.configurablePortUsageCheck(A0_131)
  local L1_132
  L1_132 = A0_131["ConfigPort.LogicalIfName"]
  if L1_132 ~= "LAN" then
    L1_132 = ""
    if db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") ~= "DWC-1000" then
      L1_132 = db.getRowsWhere("TrafficSelector", "PortName = 'OptionalPort'")
      if L1_132 ~= nil and #L1_132 ~= 0 then
        return "ERROR", "11489"
      end
    end
    L1_132 = db.getRowsWhere("PortMirroring", "MirroringEnable = 1 and CapturePort = 'OptionalPort'")
    if L1_132 ~= nil and #L1_132 ~= 0 then
      return "ERROR", "11488"
    end
  end
  L1_132 = "OK"
  return L1_132, "12265"
end
function nimfView.checkOptionWanTables(A0_133)
  local L1_134, L2_135, L3_136, L4_137, L5_138, L6_139, L7_140, L8_141, L9_142, L10_143, L11_144, L12_145, L13_146
  L1_134 = {
    L2_135,
    L3_136,
    L4_137,
    L5_138,
    L6_139,
    L7_140,
    L8_141,
    L9_142,
    L10_143
  }
  L2_135 = "10311"
  L3_136 = "12265"
  L4_137 = "12784"
  L5_138 = "11887"
  L6_139 = "13368"
  L7_140 = "13369"
  L8_141 = "13370"
  L9_142 = "13371"
  L10_143 = "13372"
  L2_135 = I18N
  L2_135 = L2_135.translate
  L3_136 = L1_134
  L2_135 = L2_135(L3_136)
  L3_136 = db
  L3_136 = L3_136.getAttribute
  L4_137 = "ConfigPort"
  L5_138 = "_ROWID_"
  L6_139 = "1"
  L7_140 = "LogicalIfName"
  L3_136 = L3_136(L4_137, L5_138, L6_139, L7_140)
  L4_137 = db
  L4_137 = L4_137.getAttribute
  L5_138 = "unitInfo"
  L6_139 = "_ROWID_"
  L7_140 = "1"
  L8_141 = "modelId"
  L4_137 = L4_137(L5_138, L6_139, L7_140, L8_141)
  L5_138 = {}
  if L4_137 == "DWC-1000" then
    L6_139 = "ProfileKey = 2 and ConfigDefault != 1"
    L7_140 = db
    L7_140 = L7_140.getRowsWhere
    L8_141 = "qosClassQueue"
    L9_142 = L6_139
    L7_140 = L7_140(L8_141, L9_142)
    L5_138 = L7_140
  else
    L6_139 = db
    L6_139 = L6_139.getRowsWhere
    L7_140 = "BandWidthProfile"
    L8_141 = "WANID = '"
    L9_142 = L3_136
    L10_143 = "'"
    L8_141 = L8_141 .. L9_142 .. L10_143
    L6_139 = L6_139(L7_140, L8_141)
    L5_138 = L6_139
  end
  L6_139 = db
  L6_139 = L6_139.getRowsWhere
  L7_140 = "FirewallRules"
  L8_141 = "((DestinationPublicInterface = 'WAN2' AND RuleType = 'INSECURE_SECURE') OR "
  L9_142 = "(DestinationPublicInterface = 'WAN2' AND RuleType = 'INSECURE_PUBLIC') OR "
  L10_143 = "(SNATInterface = 'WAN2' AND RuleType ='SECURE_INSECURE') OR "
  L11_144 = "(SNATInterface = 'WAN2' AND RuleType ='PUBLIC_INSECURE'))"
  L8_141 = L8_141 .. L9_142 .. L10_143 .. L11_144
  L6_139 = L6_139(L7_140, L8_141)
  L7_140 = db
  L7_140 = L7_140.getRowsWhere
  L8_141 = "ProtocolBinding"
  L9_142 = "LocalGatewayType = 2"
  L7_140 = L7_140(L8_141, L9_142)
  L8_141 = db
  L8_141 = L8_141.getRowsWhere
  L9_142 = "route"
  L10_143 = "interfaceName = 'WAN2'"
  L8_141 = L8_141(L9_142, L10_143)
  L9_142 = db
  L9_142 = L9_142.getRowsWhere
  L10_143 = "IpsecVPNPolicy"
  L11_144 = "LocalGateway = 1"
  L9_142 = L9_142(L10_143, L11_144)
  L10_143 = 0
  if L5_138 ~= nil then
    L11_144 = #L5_138
  else
    if L11_144 == 0 then
      if L6_139 ~= nil then
        L11_144 = #L6_139
      elseif L11_144 == 0 then
        if L7_140 ~= nil then
          L11_144 = #L7_140
        elseif L11_144 == 0 then
          if L8_141 ~= nil then
            L11_144 = #L8_141
          elseif L11_144 == 0 then
            if L9_142 ~= nil then
              L11_144 = #L9_142
            end
          end
        end
      end
  end
  elseif L11_144 ~= 0 then
    L10_143 = 1
  end
  L11_144 = 0
  L12_145 = {}
  L13_146 = #L5_138
  if L13_146 ~= 0 then
    L11_144 = L11_144 + 1
    if L4_137 == "DWC-1000" then
      L13_146 = L2_135["13368"]
      L13_146 = L13_146 or "i18nHTMLMissing"
      L12_145[L11_144] = L13_146
    else
      L13_146 = L2_135["10311"]
      L13_146 = L13_146 or "i18nHTMLMissing"
      L12_145[L11_144] = L13_146
    end
  end
  L13_146 = #L6_139
  if L13_146 ~= 0 then
    L11_144 = L11_144 + 1
    L13_146 = L2_135["13371"]
    L13_146 = L13_146 or "i18nHTMLMissing"
    L12_145[L11_144] = L13_146
  end
  L13_146 = #L7_140
  if L13_146 ~= 0 then
    L11_144 = L11_144 + 1
    L13_146 = L2_135["11887"]
    L13_146 = L13_146 or "i18nHTMLMissing"
    L12_145[L11_144] = L13_146
  end
  L13_146 = #L8_141
  if L13_146 ~= 0 then
    L11_144 = L11_144 + 1
    L13_146 = L2_135["13369"]
    L13_146 = L13_146 or "i18nHTMLMissing"
    L12_145[L11_144] = L13_146
  end
  L13_146 = #L9_142
  if L13_146 ~= 0 then
    L11_144 = L11_144 + 1
    L13_146 = L2_135["13370"]
    L13_146 = L13_146 or "i18nHTMLMissing"
    L12_145[L11_144] = L13_146
  end
  L13_146 = L12_145[1]
  L13_146 = L13_146 or ""
  if L11_144 ~= 1 then
    for _FORV_17_ = 2, L11_144 do
      if _FORV_17_ ~= L11_144 then
        L13_146 = L13_146 .. ", " .. L12_145[_FORV_17_]
      else
        L13_146 = L13_146 .. " and " .. L12_145[_FORV_17_]
      end
    end
  end
  if L3_136 == "WAN2" and A0_133["ConfigPort.LogicalIfName"] ~= "WAN2" and L10_143 == 1 then
    return "ERROR", L2_135["12784"] .. " " .. L13_146
  elseif L5_138 ~= nil and #L5_138 ~= 0 and L3_136 == "DMZ" then
    return "ERROR", L2_135["13372"]
  else
    return "OK", L2_135["12265"]
  end
end
function nimfView.wanConfigSet(A0_147, A1_148, A2_149)
  logIfName = A0_147["NimfConf.LogicalIfName"] or "WAN1"
  if A0_147["Wan.IspType"] == "8" then
    A0_147["Wan.IspLoginRequired"] = "1"
    A0_147["Wan.IspType"] = "7"
  elseif A0_147["Wan.IspType"] == "4" then
    A0_147["Wan.IspLoginRequired"] = "1"
    A0_147["Wan.IspType"] = "3"
  elseif A0_147["Wan.IspType"] == "5" then
    A0_147["Wan.IspLoginRequired"] = "1"
    A0_147["Wan.IspType"] = "4"
  elseif A0_147["Wan.IspType"] == "6" then
    A0_147["Wan.IspLoginRequired"] = "1"
    A0_147["Wan.IspType"] = "5"
  elseif A0_147["Wan.IspType"] == "7" then
    A0_147["Wan.IspLoginRequired"] = "1"
    A0_147["Wan.IspType"] = "6"
  elseif A0_147["Wan.IspType"] == "3" then
    A0_147["Wan.IspLoginRequired"] = "1"
    A0_147["Wan.IspType"] = "2"
  elseif A0_147["Wan.IspType"] == "2" then
    A0_147["Wan.IspLoginRequired"] = "1"
    A0_147["Wan.IspType"] = "1"
  elseif A0_147["Wan.IspType"] == "1" then
    A0_147["Wan.IspLoginRequired"] = "0"
    A0_147["Wan.IsGetIpDyn"] = "0"
    A0_147["Wan.IspType"] = nil
  elseif A0_147["Wan.IspType"] == "9" then
    A0_147["Wan.IspLoginRequired"] = "1"
    A0_147["Wan.IspType"] = "8"
  else
    A0_147["Wan.IspLoginRequired"] = "0"
    A0_147["Wan.IsGetIpDyn"] = "1"
    A0_147["Wan.IspType"] = nil
  end
  return nimfView.wanConfigSetWrap(A0_147, A1_148, A2_149)
end
function nimfView.wanConfigurationGet(A0_150)
  logIfName = A0_150 or "WAN1"
  if nimfView.wanConfigGetWrap(logIfName)["Wan.IspType"] == "1" then
    nimfView.wanConfigGetWrap(logIfName)["Wan.IspType"] = "2"
  elseif nimfView.wanConfigGetWrap(logIfName)["Wan.IspType"] == "2" then
    nimfView.wanConfigGetWrap(logIfName)["Wan.IspType"] = "3"
  elseif nimfView.wanConfigGetWrap(logIfName)["Wan.IspType"] == "3" then
    nimfView.wanConfigGetWrap(logIfName)["Wan.IspType"] = "4"
  elseif nimfView.wanConfigGetWrap(logIfName)["Wan.IspType"] == "7" then
    nimfView.wanConfigGetWrap(logIfName)["Wan.IspType"] = "8"
  elseif nimfView.wanConfigGetWrap(logIfName)["Wan.IspType"] == "4" then
    nimfView.wanConfigGetWrap(logIfName)["Wan.IspType"] = "5"
  elseif nimfView.wanConfigGetWrap(logIfName)["Wan.IspType"] == "5" then
    nimfView.wanConfigGetWrap(logIfName)["Wan.IspType"] = "6"
  elseif nimfView.wanConfigGetWrap(logIfName)["Wan.IspType"] == "6" then
    nimfView.wanConfigGetWrap(logIfName)["Wan.IspType"] = "7"
  elseif nimfView.wanConfigGetWrap(logIfName)["Wan.IspType"] == "8" then
    nimfView.wanConfigGetWrap(logIfName)["Wan.IspType"] = "9"
  elseif nimfView.wanConfigGetWrap(logIfName)["Wan.IspLoginRequired"] == "0" and nimfView.wanConfigGetWrap(logIfName)["Wan.IsGetIpDyn"] == "0" then
    nimfView.wanConfigGetWrap(logIfName)["Wan.IspType"] = "1"
  elseif nimfView.wanConfigGetWrap(logIfName)["Wan.IspLoginRequired"] == "0" and nimfView.wanConfigGetWrap(logIfName)["Wan.IsGetIpDyn"] == "1" then
    nimfView.wanConfigGetWrap(logIfName)["Wan.IspType"] = "0"
  end
  return (nimfView.wanConfigGetWrap(logIfName))
end
function nimfView.macAddressGet(A0_151)
  local L1_152, L2_153, L3_154
  L1_152 = db
  L1_152 = L1_152.getAttribute
  L2_153 = "networkInterface"
  L3_154 = "LogicalIfName"
  L1_152 = L1_152(L2_153, L3_154, A0_151, "interfaceName")
  L2_153 = db
  L2_153 = L2_153.getAttribute
  L3_154 = "networkInterface"
  L2_153 = L2_153(L3_154, "LogicalIfName", A0_151, "VirtualIfName")
  L3_154 = ""
  if L1_152 ~= returnCodes.NIL then
    if string.sub(L2_153, 1, 3) == "ppp" then
      L3_154 = "00:00:00:00:00:00"
    elseif string.sub(L2_153, 1, 3) == "usb" then
      if io.popen("ifconfig usb0") ~= nil then
        if io.popen("ifconfig usb0"):read() ~= nil then
          L3_154 = io.popen("ifconfig usb0"):read():match("HWaddr ([%:%x]*)")
        else
          L3_154 = "N/A"
        end
        io.popen("ifconfig usb0"):close()
      end
    else
      L3_154 = db.getAttribute("ethernet", "interfaceName", L1_152, "macAddress") or ""
    end
  end
  return L3_154
end
function getConnectionTypes(A0_155)
  local L1_156
  L1_156 = "0"
  if db.getRowWhere("NimfConf", "LogicalIfName = '" .. A0_155 .. "' and AddressFamily = " .. addressFamily) ~= nil then
    if db.getRowWhere("NimfConf", "LogicalIfName = '" .. A0_155 .. "' and AddressFamily = " .. addressFamily)["NimfConf.ConnectionType"] == "pptp" then
      if db.getRowWhere("Pptp", "LogicalIfName = '" .. A0_155 .. "'") ~= nil then
        if db.getRowWhere("Pptp", "LogicalIfName = '" .. A0_155 .. "'")["Pptp.DualAccess"] == "1" then
          L1_156 = "5"
        elseif db.getRowWhere("Pptp", "LogicalIfName = '" .. A0_155 .. "'")["Pptp.DualAccess"] == "0" then
          L1_156 = "3"
        end
      end
    elseif db.getRowWhere("NimfConf", "LogicalIfName = '" .. A0_155 .. "' and AddressFamily = " .. addressFamily)["NimfConf.ConnectionType"] == "pppoe" then
      if db.getRowsWhere("PppoeProfile", "LogicalIfName = '" .. A0_155 .. "' and Status=1") ~= nil then
        if #db.getRowsWhere("PppoeProfile", "LogicalIfName = '" .. A0_155 .. "' and Status=1") == 2 then
          L1_156 = "7"
        else
          L1_156 = "2"
        end
      end
    elseif db.getRowWhere("NimfConf", "LogicalIfName = '" .. A0_155 .. "' and AddressFamily = " .. addressFamily)["NimfConf.ConnectionType"] == "l2tp" then
      if db.getRowWhere("L2tp", "LogicalIfName = '" .. A0_155 .. "'") ~= nil then
        if db.getRowWhere("L2tp", "LogicalIfName = '" .. A0_155 .. "'")["L2tp.DualAccess"] == "1" then
          L1_156 = "6"
        elseif db.getRowWhere("L2tp", "LogicalIfName = '" .. A0_155 .. "'")["L2tp.DualAccess"] == "0" then
          L1_156 = "4"
        end
      end
    elseif db.getRowWhere("NimfConf", "LogicalIfName = '" .. A0_155 .. "' and AddressFamily = " .. addressFamily)["NimfConf.ConnectionType"] == "dualPppoe" then
      if db.getRowWhere("DualPppoe", "LogicalIfName = '" .. A0_155 .. "'") ~= nil then
        L1_156 = "9"
      end
    elseif db.getRowWhere("NimfConf", "LogicalIfName = '" .. A0_155 .. "' and AddressFamily = " .. addressFamily)["NimfConf.ConnectionType"] == "threeg" then
      if db.getRowWhere("ThreeG", "LogicalIfName = '" .. A0_155 .. "'") ~= nil then
        L1_156 = "8"
      end
    elseif db.getRowWhere("NimfConf", "LogicalIfName = '" .. A0_155 .. "' and AddressFamily = " .. addressFamily)["NimfConf.ConnectionType"] == "ifStatic" then
      L1_156 = "1"
    elseif db.getRowWhere("NimfConf", "LogicalIfName = '" .. A0_155 .. "' and AddressFamily = " .. addressFamily)["NimfConf.ConnectionType"] == "dhcpc" then
      L1_156 = "0"
    end
  end
  return L1_156
end
