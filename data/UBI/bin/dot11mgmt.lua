local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9
L0_0 = require
L1_1 = "teamf1lualib/db"
L0_0(L1_1)
L0_0 = arg
L0_0 = L0_0[1]
L1_1 = arg
L1_1 = L1_1[3]
L2_2 = tonumber
L3_3 = arg
L3_3 = L3_3[2]
L2_2 = L2_2(L3_3)
L3_3 = tonumber
L4_4 = arg
L4_4 = L4_4[4]
L3_3 = L3_3(L4_4)
L4_4 = 5
L5_5 = db
L5_5 = L5_5.connect
L6_6 = L0_0
L5_5(L6_6)
if L1_1 == "dot11Radio" or L1_1 == "dot11VAP" then
  L5_5 = db
  L5_5 = L5_5.getRow
  L6_6 = "dot11Radio"
  L7_7 = "rowid"
  L8_8 = L3_3
  L5_5 = L5_5(L6_6, L7_7, L8_8)
  L6_6 = db
  L6_6 = L6_6.getRows
  L7_7 = "dot11vap"
  L8_8 = "vapenabled"
  L9_9 = "1"
  L6_6 = L6_6(L7_7, L8_8, L9_9)
  if L5_5 then
    L7_7 = L5_5["dot11Radio.opMode"]
    if L7_7 ~= "na" then
      L7_7 = L5_5["dot11Radio.opMode"]
      if L7_7 ~= "na40+" then
        L7_7 = L5_5["dot11Radio.opMode"]
        if L7_7 ~= "na40-" then
          L7_7 = L5_5["dot11Radio.opMode"]
          if L7_7 ~= "ac" then
            L7_7 = L5_5["dot11Radio.opMode"]
            if L7_7 ~= "ac40-" then
              L7_7 = L5_5["dot11Radio.opMode"]
              if L7_7 ~= "ac40+" then
                L7_7 = L5_5["dot11Radio.opMode"]
                if L7_7 ~= "ac80" then
                  L7_7 = L5_5["dot11Radio.opMode"]
                end
              end
            end
          end
        end
      end
    elseif L7_7 == "a only" then
      L7_7 = os
      L7_7 = L7_7.execute
      L8_8 = "ledCtrl 13 0"
      L7_7(L8_8)
      L7_7 = os
      L7_7 = L7_7.execute
      L8_8 = "ledCtrl 12 1"
      L7_7(L8_8)
      L7_7 = os
      L7_7 = L7_7.execute
      L8_8 = "echo 1 > /var/wifi5.out"
      L7_7(L8_8)
      L7_7 = os
      L7_7 = L7_7.execute
      L8_8 = "echo 0 > /var/wifi24.out"
      L7_7(L8_8)
    end
  else
    L7_7 = os
    L7_7 = L7_7.execute
    L8_8 = "ledCtrl 13 1"
    L7_7(L8_8)
    L7_7 = os
    L7_7 = L7_7.execute
    L8_8 = "ledCtrl 12 0"
    L7_7(L8_8)
    L7_7 = os
    L7_7 = L7_7.execute
    L8_8 = "echo 0 > /var/wifi5.out"
    L7_7(L8_8)
    L7_7 = os
    L7_7 = L7_7.execute
    L8_8 = "echo 1 > /var/wifi24.out"
    L7_7(L8_8)
  end
  if L6_6 then
    L7_7 = #L6_6
  elseif L7_7 == 0 then
    L7_7 = os
    L7_7 = L7_7.execute
    L8_8 = "ledCtrl 13 1"
    L7_7(L8_8)
    L7_7 = os
    L7_7 = L7_7.execute
    L8_8 = "ledCtrl 12 1"
    L7_7(L8_8)
    L7_7 = os
    L7_7 = L7_7.execute
    L8_8 = "echo 0 > /var/wifi5.out"
    L7_7(L8_8)
    L7_7 = os
    L7_7 = L7_7.execute
    L8_8 = "echo 0 > /var/wifi24.out"
    L7_7(L8_8)
  end
elseif L1_1 == "dot11WPSSessStatus" then
  L5_5 = db
  L5_5 = L5_5.getRow
  L6_6 = "dot11WPSSessStatus"
  L7_7 = "rowid"
  L8_8 = "1"
  L5_5 = L5_5(L6_6, L7_7, L8_8)
  L6_6 = db
  L6_6 = L6_6.getAttribute
  L7_7 = "dot11WPS"
  L8_8 = "rowid"
  L9_9 = "1"
  L6_6 = L6_6(L7_7, L8_8, L9_9, "wpsEnabled")
  L7_7 = db
  L7_7 = L7_7.getAttribute
  L8_8 = "dot11WPS"
  L9_9 = "rowid"
  L7_7 = L7_7(L8_8, L9_9, "1", "vapName")
  L8_8 = db
  L8_8 = L8_8.getRows
  L9_9 = "dot11vap"
  L8_8 = L8_8(L9_9, "vapenabled", "1")
  L9_9 = db
  L9_9 = L9_9.getAttribute
  L9_9 = L9_9("dot11Interface", "vapName", L7_7, "radioNo")
  if tonumber(L6_6) == 1 then
    if tonumber(L5_5["dot11WPSSessStatus.sessionStatus"]) == 1 then
      if L5_5["dot11WPSSessStatus.sessionMsg"] == "Initializing WPS session" then
        while true do
          if L5_5["dot11WPSSessStatus.sessionMsg"] ~= "Sending message M8" and tonumber(L5_5["dot11WPSSessStatus.sessionStatus"]) ~= 0 then
            L5_5 = db.getRow("dot11WPSSessStatus", "rowid", "1")
            if db.getAttribute("dot11Radio", "radioNo", L9_9, "band") == "a" then
              os.execute("ledCtrl 13 1")
              os.execute("usleep 120000")
              os.execute("ledCtrl 13 0")
              os.execute("usleep 120000")
              os.execute("echo 2 > /var/wps.out")
            end
            os.execute("ledCtrl 12 1")
            os.execute("usleep 120000")
            os.execute("ledCtrl 12 0")
            os.execute("usleep 120000")
            os.execute("echo 2 > /var/wps.out")
            elseif L5_5["dot11WPSSessStatus.sessionMsg"] == "WPS session timed out" or L5_5["dot11WPSSessStatus.sessionMsg"] == "WPS registration failed" or L5_5["dot11WPSSessStatus.sessionMsg"] == "WPS session failed !!" then
              os.execute("echo 0 > /var/wps.out")
            end
          end
        end
      end
    if not L8_8 or #L8_8 == 0 then
      os.execute("ledCtrl 13 1")
      os.execute("ledCtrl 12 1")
      os.execute("echo 0 > /var/wifi5.out")
      os.execute("echo 0 > /var/wifi24.out")
    elseif db.getAttribute("dot11Radio", "radioNo", L9_9, "band") == "a" then
      os.execute("ledCtrl 13 0")
    else
      os.execute("ledCtrl 12 0")
    end
  end
end
L5_5 = db
L5_5 = L5_5.close
L5_5()
