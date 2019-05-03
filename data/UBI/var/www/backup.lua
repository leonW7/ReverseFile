local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9
L0_0 = require
L1_1 = "teamf1lualib/errorMap"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/returnCodes"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/db"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/config"
L0_0(L1_1)
L0_0 = require
L1_1 = "com.teamf1.core.returnCodes"
L0_0 = L0_0(L1_1)
L1_1 = require
L2_2 = "com.teamf1.core.errorMap"
L1_1 = L1_1(L2_2)
L2_2 = ACCESS_LEVEL
if L2_2 ~= 0 then
  L2_2 = util
  L2_2 = L2_2.fileExists
  L3_3 = "/tmp/bootComplete"
  L2_2 = L2_2(L3_3)
  if not L2_2 then
    L3_3 = L1_1.errorStringGet
    L4_4 = L0_0.ROUTER_INITIALIZING_AFTER_REBOOT
    L3_3 = L3_3(L4_4)
    statusErrorMessage = L3_3
  else
    L3_3 = L1_1.errorStringGet
    L4_4 = L0_0.UNAUTHORIZED
    L3_3 = L3_3(L4_4)
    statusErrorMessage = L3_3
  end
  L3_3 = "backupRestore.html"
  Page = L3_3
  L3_3 = web
  L3_3 = L3_3.goToPage
  L4_4 = Page
  L5_5 = false
  L6_6 = true
  L3_3(L4_4, L5_5, L6_6)
else
  L2_2 = UNIT_INFO
  L3_3 = string
  L3_3 = L3_3.find
  L4_4 = L2_2 or ""
  L5_5 = "-"
  L4_4 = L3_3(L4_4, L5_5)
  if L3_3 ~= nil and L4_4 ~= nil then
    L5_5 = string
    L5_5 = L5_5.sub
    L6_6 = L2_2
    L7_7 = 0
    L8_8 = L3_3 - 1
    L5_5 = L5_5(L6_6, L7_7, L8_8)
    L2_2 = L5_5
  end
  L5_5 = L2_2 or L5_5(L6_6, L7_7, L8_8, L9_9)
  L6_6 = config
  L6_6 = L6_6.compareChecksum
  L6_6 = L6_6()
  L7_7 = UNIT_NAME
  if L7_7 == "DWC-1000" then
    L7_7 = util
    L7_7 = L7_7.appendDebugOut
    L8_8 = "Exec = "
    L9_9 = os
    L9_9 = L9_9.execute
    L9_9 = L9_9("cd /tmp && mkdir backup && cp /flash/tmp/teamf1.cfg.ascii /flash/tmp/startup-config backup/")
    L8_8 = L8_8 .. L9_9
    L7_7(L8_8)
    if L6_6 == 1 then
      L7_7 = db
      L7_7 = L7_7.save
      L7_7()
    end
    L7_7 = util
    L7_7 = L7_7.appendDebugOut
    L8_8 = "Exec = "
    L9_9 = os
    L9_9 = L9_9.execute
    L9_9 = L9_9("cd /tmp && tar -cf" .. " " .. L5_5 .. ".tgz" .. " " .. "backup")
    L8_8 = L8_8 .. L9_9
    L7_7(L8_8)
    L7_7 = web
    L7_7 = L7_7.download
    L8_8 = "/tmp/"
    L9_9 = L5_5
    L8_8 = L8_8 .. L9_9 .. ".tgz"
    L9_9 = L5_5
    L9_9 = L9_9 .. ".tgz"
    L7_7(L8_8, L9_9)
    L7_7 = util
    L7_7 = L7_7.appendDebugOut
    L8_8 = "Exec = "
    L9_9 = os
    L9_9 = L9_9.execute
    L9_9 = L9_9("rm -rf /tmp/backup  /tmp/DWC.tgz ")
    L8_8 = L8_8 .. L9_9
    L7_7(L8_8)
  else
    L7_7 = db
    L7_7 = L7_7.getAttribute
    L8_8 = "ConfigSupport"
    L9_9 = "_ROWID_"
    L7_7 = L7_7(L8_8, L9_9, "1", "EncryptEnable")
    if L7_7 ~= nil and L7_7 == "1" then
      L8_8, L9_9 = nil, nil
      L8_8 = io.open("/pfrm2.0/pkgMgmt/packageKey", "r"):read("*l")
      L9_9 = io.open("/pfrm2.0/pkgMgmt/packageKey", "r"):read("*l")
      io.open("/pfrm2.0/pkgMgmt/packageKey", "r"):close()
      if L6_6 == 1 then
        db.save()
      end
      util.appendDebugOut("Exec = " .. os.execute("/pfrm2.0/bin/usrKlite openssl enc -aes-128-cbc -in " .. SETTINGS_FILE .. " -out " .. SETTINGS_FILE .. ".enc -K " .. L8_8 .. " -iv " .. L9_9 .. " -nosalt"))
      web.download(SETTINGS_FILE .. ".enc", L5_5 .. ".cfg.enc")
      util.appendDebugOut("Exec = " .. os.execute("/bin/rm " .. SETTINGS_FILE .. ".enc"))
    else
      if L6_6 == 1 then
        L8_8 = db
        L8_8 = L8_8.save
        L8_8()
      end
      L8_8 = web
      L8_8 = L8_8.download
      L9_9 = SETTINGS_FILE
      L8_8(L9_9, L5_5 .. ".cfg")
    end
  end
end
