local L0_0, L1_1
L0_0 = {}
wanWizard = L0_0
L0_0 = wanWizard
function L1_1(A0_2, A1_3, A2_4)
  if db.typeAndRangeValidate(A0_2) then
    if A2_4 == "add" then
      return db.insert(DBTable, A0_2)
    elseif A2_4 == "edit" then
      return db.update(DBTable, A0_2, A1_3)
    elseif A2_4 == "delete" then
      return db.delete(DBTable, A0_2)
    end
  else
    return false
  end
end
L0_0.config = L1_1
L0_0 = wanWizard
function L1_1(A0_5)
  local L1_6, L2_7, L3_8, L4_9, L5_10, L6_11, L7_12, L8_13, L9_14, L10_15, L11_16, L12_17, L13_18, L14_19, L15_20, L16_21, L17_22, L18_23, L19_24, L20_25, L21_26, L22_27, L23_28, L24_29, L25_30, L26_31
  L1_6 = "1"
  L2_7 = "3"
  L3_8 = "1"
  L4_9 = "WAN1"
  L5_10 = "2"
  L6_11 = 2
  L7_12 = {}
  L8_13 = ACCESS_LEVEL
  if L8_13 ~= 0 then
    L8_13 = "ACCESS_DENIED"
    L9_14 = "10187"
    return L8_13, L9_14
  end
  L8_13 = db
  L8_13 = L8_13.beginTransaction
  L8_13()
  L8_13 = false
  L9_14 = db
  L9_14 = L9_14.getAttribute
  L10_15 = "UserGroups"
  L11_16 = "GroupName"
  L12_17 = "ADMIN"
  L13_18 = "GroupId"
  L9_14 = L9_14(L10_15, L11_16, L12_17, L13_18)
  L9_14 = L9_14 or ""
  L10_15 = "GroupId = "
  L11_16 = L9_14
  L12_17 = " and DefaultUser = "
  L13_18 = L1_6
  L10_15 = L10_15 .. L11_16 .. L12_17 .. L13_18
  if L10_15 ~= nil then
    L11_16 = db
    L11_16 = L11_16.getRowWhere
    L12_17 = "Users"
    L13_18 = L10_15
    L11_16 = L11_16(L12_17, L13_18)
    L7_12 = L11_16
  end
  if L7_12 ~= nil then
    L11_16 = A0_5["Users.Password"]
    if L11_16 then
      L11_16 = util
      L11_16 = L11_16.isAllMasked
      L12_17 = A0_5["Users.Password"]
      L11_16 = L11_16(L12_17)
      if L11_16 == false then
        L11_16 = A0_5["Users.Password"]
        L7_12["Users.Password"] = L11_16
        L11_16 = "Users"
        DBTable = L11_16
        L11_16 = wanWizard
        L11_16 = L11_16.config
        L12_17 = L7_12
        L13_18 = L7_12["Users._ROWID_"]
        L14_19 = "edit"
        L11_16 = L11_16(L12_17, L13_18, L14_19)
        L8_13 = L11_16
      end
    else
      L8_13 = true
    end
  else
    L11_16 = db
    L11_16 = L11_16.rollback
    L11_16()
    L11_16 = "ERROR"
    L12_17 = "12808"
    return L11_16, L12_17
  end
  if L8_13 then
    L11_16 = db
    L11_16 = L11_16.getRow
    L12_17 = "ntp"
    L13_18 = "_ROWID_"
    L14_19 = L3_8
    L11_16 = L11_16(L12_17, L13_18, L14_19)
    if L11_16 ~= nil then
      L12_17 = A0_5["ntp.timezone"]
      L11_16["ntp.timezone"] = L12_17
      L12_17 = "ntp"
      DBTable = L12_17
      L12_17 = wanWizard
      L12_17 = L12_17.config
      L13_18 = L11_16
      L14_19 = L11_16["ntp._ROWID_"]
      L15_20 = "edit"
      L12_17 = L12_17(L13_18, L14_19, L15_20)
      L8_13 = L12_17
    else
      L12_17 = db
      L12_17 = L12_17.rollback
      L12_17()
      L12_17 = "ERROR"
      L13_18 = "12809"
      return L12_17, L13_18
    end
  end
  if L8_13 then
    L11_16 = db
    L11_16 = L11_16.getRowWhere
    L12_17 = "NimfConf"
    L13_18 = "LogicalIfName = '"
    L14_19 = L4_9
    L15_20 = "' and AddressFamily = "
    L16_21 = L5_10
    L13_18 = L13_18 .. L14_19 .. L15_20 .. L16_21
    L11_16 = L11_16(L12_17, L13_18)
    L12_17 = 1
    while L11_16 == nil and L12_17 <= 3 do
      L13_18 = db
      L13_18 = L13_18.getRowWhere
      L14_19 = "NimfConf"
      L15_20 = "LogicalIfName = '"
      L16_21 = L4_9
      L17_22 = "' and AddressFamily = "
      L15_20 = L15_20 .. L16_21 .. L17_22 .. L18_23
      L13_18 = L13_18(L14_19, L15_20)
      L11_16 = L13_18
      L12_17 = L12_17 + 1
    end
    if L11_16 == nil then
      L13_18 = db
      L13_18 = L13_18.rollback
      L13_18()
      L13_18 = "ERROR"
      L14_19 = "10994"
      return L13_18, L14_19
    end
    L13_18 = L11_16["NimfConf._ROWID_"]
    L14_19 = {}
    L15_20 = {}
    L16_21 = L11_16["NimfConf.ConnectionType"]
    if L16_21 == "pppoe" then
      L16_21 = A0_5["Wan.IspType"]
      if L16_21 ~= "2" then
        L16_21 = "LogicalIfName = '"
        L17_22 = L4_9
        L16_21 = L16_21 .. L17_22 .. L18_23
        L17_22 = "LogicalIfName = '"
        L17_22 = L17_22 .. L18_23 .. L19_24
        if L19_24 ~= nil then
          for L24_29, L25_30 in L21_26(L22_27) do
            L26_31 = L19_24[L20_25]
            if L26_31["PppoeProfile.Status"] == "1" then
              L26_31["PppoeProfile.Status"] = 0
              DBTable = "PppoeProfile"
              L8_13 = wanWizard.config(L26_31, L26_31["PppoeProfile._ROWID_"], "edit")
              if not L8_13 then
                db.rollback()
                return "ERROR", "11830"
              end
            end
          end
        end
        L14_19["NimfConf.IfStatus"] = "1"
      end
    end
    L14_19["NimfConf.LogicalIfName"] = L4_9
    L16_21 = A0_5["Wan.IspType"]
    if L16_21 == "0" then
      L14_19["NimfConf.RequireLogin"] = "0"
      L14_19["NimfConf.ConnectionType"] = "dhcpc"
      L16_21 = A0_5["Wan.UseMac"]
      if L16_21 ~= nil then
        L16_21 = A0_5["Wan.UseMac"]
        L14_19["NimfConf.SetMacAddress"] = L16_21
        L16_21 = A0_5["Wan.UseMac"]
        if L16_21 == "2" then
          L16_21 = A0_5["Wan.macAddress"]
          L14_19["NimfConf.MacAddress"] = L16_21
        end
      end
      L15_20["Dhcpc.LogicalIfName"] = L4_9
      L16_21 = A0_5["Wan.HostName"]
      L15_20["Dhcpc.HostName"] = L16_21
      L16_21 = A0_5["Wan.IsDNSDyn"]
      L15_20["Dhcpc.GetDnsFromIsp"] = L16_21
      L16_21 = A0_5["Wan.IsDNSDyn"]
      if L16_21 == "0" then
        L16_21 = A0_5["Wan.PriDnsIpAddr"]
        L15_20["Dhcpc.PrimaryDns"] = L16_21
        L16_21 = A0_5["Wan.SecDnsIpAddr"]
        L15_20["Dhcpc.SecondaryDns"] = L16_21
      end
      L16_21 = "Dhcpc"
      DBTable = L16_21
      L16_21 = db
      L16_21 = L16_21.existsRowWhere
      L17_22 = "Dhcpc"
      L16_21 = L16_21(L17_22, L18_23)
      if L16_21 then
        L16_21 = wanWizard
        L16_21 = L16_21.config
        L17_22 = L15_20
        L16_21 = L16_21(L17_22, L18_23, L19_24)
        L8_13 = L16_21
      else
        L16_21 = wanWizard
        L16_21 = L16_21.config
        L17_22 = L15_20
        L16_21 = L16_21(L17_22, L18_23, L19_24)
        L8_13 = L16_21
      end
    else
      L16_21 = A0_5["Wan.IspType"]
      if L16_21 == "1" then
        L14_19["NimfConf.RequireLogin"] = "0"
        L14_19["NimfConf.ConnectionType"] = "ifStatic"
        L15_20["ifStatic.LogicalIfName"] = L4_9
        L16_21 = A0_5["Wan.IpAddr"]
        L15_20["ifStatic.StaticIp"] = L16_21
        L16_21 = A0_5["Wan.SnetMask"]
        L15_20["ifStatic.NetMask"] = L16_21
        L16_21 = A0_5["Wan.GwIpAddr"]
        L15_20["ifStatic.Gateway"] = L16_21
        L16_21 = A0_5["Wan.PriDnsIpAddr"]
        L15_20["ifStatic.PrimaryDns"] = L16_21
        L16_21 = A0_5["Wan.SecDnsIpAddr"]
        L15_20["ifStatic.SecondaryDns"] = L16_21
        L15_20["ifStatic.AddressFamily"] = L5_10
        L16_21 = "ifStatic"
        DBTable = L16_21
        L16_21 = db
        L16_21 = L16_21.existsRowWhere
        L17_22 = "ifStatic"
        L16_21 = L16_21(L17_22, L18_23)
        if L16_21 then
          L16_21 = wanWizard
          L16_21 = L16_21.config
          L17_22 = L15_20
          L16_21 = L16_21(L17_22, L18_23, L19_24)
          L8_13 = L16_21
        else
          L16_21 = wanWizard
          L16_21 = L16_21.config
          L17_22 = L15_20
          L16_21 = L16_21(L17_22, L18_23, L19_24)
          L8_13 = L16_21
        end
      else
        L16_21 = A0_5["Wan.IspType"]
        if L16_21 == "2" then
          L16_21 = {}
          L17_22 = ""
          if L20_25 ~= 0 then
            L17_22 = "edit"
          else
            L17_22 = "add"
            L16_21["PppoeProfile.ProfileName"] = "pppoeProfile1"
          end
          L16_21["PppoeProfile.LogicalIfName"] = L4_9
          L16_21["PppoeProfile.Status"] = "1"
          L16_21["PppoeProfile.AuthOpt"] = "1"
          L16_21["PppoeProfile.UserName"] = L20_25
          L16_21["PppoeProfile.Password"] = L20_25
          L16_21["PppoeProfile.GetIpFromIsp"] = L20_25
          if L20_25 == "0" then
            L16_21["PppoeProfile.StaticIp"] = L20_25
            L16_21["PppoeProfile.NetMask"] = L20_25
          end
          L16_21["PppoeProfile.GetDnsFromIsp"] = L20_25
          if L20_25 == "0" then
            L16_21["PppoeProfile.PrimaryDns"] = L20_25
            L16_21["PppoeProfile.SecondaryDns"] = L20_25
          end
          L16_21["PppoeProfile.IdleTimeOutFlag"] = L20_25
          if L20_25 == "1" then
            L16_21["PppoeProfile.IdleTimeOutValue"] = L20_25
          end
          DBTable = L20_25
          L8_13 = L20_25
          if L8_13 then
            L20_25["Pppoe.LogicalIfName"] = L4_9
            L20_25["Pppoe.UserName"] = L21_26
            L20_25["Pppoe.Password"] = L21_26
            L20_25["Pppoe.GetIpFromIsp"] = L21_26
            if L21_26 == "0" then
              L20_25["Pppoe.StaticIp"] = L21_26
              L20_25["Pppoe.NetMask"] = L21_26
            end
            L20_25["Pppoe.GetDnsFromIsp"] = L21_26
            if L21_26 == "0" then
              L20_25["Pppoe.PrimaryDns"] = L21_26
              L20_25["Pppoe.SecondaryDns"] = L21_26
            end
            L20_25["Pppoe.IdleTimeOutFlag"] = L21_26
            L20_25["Pppoe.IdleTimeOutValue"] = L21_26
            L20_25["Pppoe.ProfileName"] = L21_26
            DBTable = L21_26
            L24_29 = "edit"
            L8_13 = L21_26
          end
          L14_19["NimfConf.RequireLogin"] = "1"
          L14_19["NimfConf.ConnectionType"] = "pppoe"
          L14_19["NimfConf.IfStatus"] = "1"
        else
          L16_21 = A0_5["Wan.IspType"]
          if L16_21 == "3" then
            L14_19["NimfConf.RequireLogin"] = "1"
            L14_19["NimfConf.ConnectionType"] = "pptp"
            L15_20["Pptp.LogicalIfName"] = L4_9
            L16_21 = A0_5["Wan.LoginName"]
            L15_20["Pptp.UserName"] = L16_21
            L16_21 = util
            L16_21 = L16_21.isAllMasked
            L17_22 = A0_5["Wan.LoginPassword"]
            L16_21 = L16_21(L17_22)
            if L16_21 == false then
              L16_21 = A0_5["Wan.LoginPassword"]
              L15_20["Pptp.Password"] = L16_21
            end
            L16_21 = A0_5["Wan.MyIpAddr"]
            L15_20["Pptp.MyIp"] = L16_21
            L16_21 = A0_5["Wan.SvrIpAddr"]
            L15_20["Pptp.ServerIp"] = L16_21
            L16_21 = A0_5["Wan.IsGetIpDyn"]
            L15_20["Pptp.GetIpFromIsp"] = L16_21
            L16_21 = A0_5["Wan.IsDNSDyn"]
            L15_20["Pptp.GetDnsFromIsp"] = L16_21
            L16_21 = A0_5["Wan.IsGetIpDyn"]
            if L16_21 == "0" then
              L16_21 = A0_5["Wan.IpAddr"]
              L15_20["Pptp.StaticIp"] = L16_21
              L16_21 = A0_5["Wan.SnetMask"]
              L15_20["Pptp.NetMask"] = L16_21
            end
            L16_21 = A0_5["Wan.IsDNSDyn"]
            if L16_21 == "0" then
              L16_21 = A0_5["Wan.PriDnsIpAddr"]
              L15_20["Pptp.PrimaryDns"] = L16_21
              L16_21 = A0_5["Wan.SecDnsIpAddr"]
              L15_20["Pptp.SecondaryDns"] = L16_21
            end
            L16_21 = A0_5["Wan.IdleTimeOutFlag"]
            L15_20["Pptp.IdleTimeOutFlag"] = L16_21
            L16_21 = A0_5["Wan.IdleTimeOutFlag"]
            if L16_21 == "1" then
              L16_21 = A0_5["Wan.IdleTime"]
              L15_20["Pptp.IdleTimeOutValue"] = L16_21
            end
            L16_21 = "Pptp"
            DBTable = L16_21
            L16_21 = db
            L16_21 = L16_21.existsRowWhere
            L17_22 = "Pptp"
            L16_21 = L16_21(L17_22, L18_23)
            if L16_21 then
              L16_21 = wanWizard
              L16_21 = L16_21.config
              L17_22 = L15_20
              L16_21 = L16_21(L17_22, L18_23, L19_24)
              L8_13 = L16_21
            else
              L16_21 = wanWizard
              L16_21 = L16_21.config
              L17_22 = L15_20
              L16_21 = L16_21(L17_22, L18_23, L19_24)
              L8_13 = L16_21
            end
          else
            L16_21 = A0_5["Wan.IspType"]
            if L16_21 == "4" then
              L14_19["NimfConf.RequireLogin"] = "1"
              L14_19["NimfConf.ConnectionType"] = "l2tp"
              L15_20["L2tp.LogicalIfName"] = L4_9
              L16_21 = A0_5["Wan.LoginName"]
              L15_20["L2tp.UserName"] = L16_21
              L16_21 = util
              L16_21 = L16_21.isAllMasked
              L17_22 = A0_5["Wan.LoginPassword"]
              L16_21 = L16_21(L17_22)
              if L16_21 == false then
                L16_21 = A0_5["Wan.LoginPassword"]
                L15_20["L2tp.Password"] = L16_21
              end
              L16_21 = A0_5["Wan.MyIpAddr"]
              L15_20["L2tp.MyIp"] = L16_21
              L16_21 = A0_5["Wan.SvrIpAddr"]
              L15_20["L2tp.ServerIp"] = L16_21
              L16_21 = A0_5["Wan.IsGetIpDyn"]
              L15_20["L2tp.GetIpFromIsp"] = L16_21
              L16_21 = A0_5["Wan.IsDNSDyn"]
              L15_20["L2tp.GetDnsFromIsp"] = L16_21
              L16_21 = A0_5["Wan.IsGetIpDyn"]
              if L16_21 == "0" then
                L16_21 = A0_5["Wan.IpAddr"]
                L15_20["L2tp.StaticIp"] = L16_21
                L16_21 = A0_5["Wan.SnetMask"]
                L15_20["L2tp.NetMask"] = L16_21
              end
              L16_21 = A0_5["Wan.IsDNSDyn"]
              if L16_21 == "0" then
                L16_21 = A0_5["Wan.PriDnsIpAddr"]
                L15_20["L2tp.PrimaryDns"] = L16_21
                L16_21 = A0_5["Wan.SecDnsIpAddr"]
                L15_20["L2tp.SecondaryDns"] = L16_21
              end
              L16_21 = A0_5["Wan.IdleTimeOutFlag"]
              L15_20["L2tp.IdleTimeOutFlag"] = L16_21
              L16_21 = A0_5["Wan.IdleTimeOutFlag"]
              if L16_21 == "1" then
                L16_21 = A0_5["Wan.IdleTime"]
                L15_20["L2tp.IdleTimeOutValue"] = L16_21
              end
              L16_21 = "L2tp"
              DBTable = L16_21
              L16_21 = db
              L16_21 = L16_21.existsRowWhere
              L17_22 = "L2tp"
              L16_21 = L16_21(L17_22, L18_23)
              if L16_21 then
                L16_21 = wanWizard
                L16_21 = L16_21.config
                L17_22 = L15_20
                L16_21 = L16_21(L17_22, L18_23, L19_24)
                L8_13 = L16_21
              else
                L16_21 = wanWizard
                L16_21 = L16_21.config
                L17_22 = L15_20
                L16_21 = L16_21(L17_22, L18_23, L19_24)
                L8_13 = L16_21
              end
            end
          end
        end
      end
    end
    if L8_13 then
      L16_21 = db
      L16_21 = L16_21.getRowsWhere
      L17_22 = "PppoeProfile"
      L16_21 = L16_21(L17_22, L18_23)
      L17_22 = db
      L17_22 = L17_22.getAttribute
      L17_22 = L17_22(L18_23, L19_24, L20_25, L21_26)
      if L17_22 == "pppoe" then
        if L18_23 ~= "pppoe" then
          if L16_21 ~= nil then
            if L18_23 ~= 0 then
              for L21_26, L22_27 in L18_23(L19_24) do
                L22_27["PppoeProfile.Status"] = "0"
                L24_29 = "PppoeProfile"
                L25_30 = L22_27
                L26_31 = L22_27["PppoeProfile._ROWID_"]
                L8_13 = L23_28
                if not L8_13 then
                  break
                end
              end
            end
          end
        end
      elseif L18_23 == "2" then
        if L18_23 == 2 then
          L18_23["PppoeProfile.Status"] = "0"
          L8_13 = L18_23
        end
      end
    end
    if L8_13 then
      L16_21 = "NimfConf"
      DBTable = L16_21
      L16_21 = wanWizard
      L16_21 = L16_21.config
      L17_22 = L14_19
      L16_21 = L16_21(L17_22, L18_23, L19_24)
      L8_13 = L16_21
    end
  end
  if L8_13 then
    L11_16 = db
    L11_16 = L11_16.commitTransaction
    L11_16()
    L11_16 = "OK"
    L12_17 = "12265"
    return L11_16, L12_17
  else
    L11_16 = db
    L11_16 = L11_16.rollback
    L11_16()
    L11_16 = "ERROR"
    L12_17 = "12813"
    return L11_16, L12_17
  end
end
L0_0.wanWizardConfig = L1_1
