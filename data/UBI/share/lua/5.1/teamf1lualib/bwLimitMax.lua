local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14
L0_0 = require
L1_1 = "teamf1lualib/util"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/db"
L0_0(L1_1)
L0_0 = require
L1_1 = "bwLimitLib"
L0_0(L1_1)
L0_0 = db
L0_0 = L0_0.connect
L1_1 = arg
L1_1 = L1_1[1]
L0_0(L1_1)
L0_0 = util
L0_0 = L0_0.setDebugStatus
L1_1 = true
L0_0(L1_1)
L0_0, L1_1, L2_2, L3_3, L4_4, L5_5 = nil, nil, nil, nil, nil, nil
L6_6 = "/pfrm2.0/bin/switchConfig /dev/bcm53980 duplex get "
while true do
  ret = L7_7
  for L10_10, L11_11 in L7_7(L8_8) do
    L3_3 = L11_11["BandWidthProfileStatus.Status"]
  end
  if L3_3 == "1" then
    ret = L7_7
    for L10_10, L11_11 in L7_7(L8_8) do
      L1_1 = L11_11["BandWidthProfile.WANID"]
      L12_12 = db
      L12_12 = L12_12.getAttribute
      L13_13 = "unitInfo"
      L14_14 = "_ROWID_"
      L12_12 = L12_12(L13_13, L14_14, "1", "modelId")
      L12_12 = L12_12 or ""
      L13_13 = db
      L13_13 = L13_13.getAttribute
      L14_14 = "unitInfo"
      L13_13 = L13_13(L14_14, "_ROWID_", "1", "hardwareVersion")
      L13_13 = L13_13 or ""
      L14_14 = db
      L14_14 = L14_14.getAttribute
      L14_14 = L14_14("hwFamilyInfo", "_ROWID_", "1", "hwFamilyName")
      L14_14 = L14_14 or ""
      ret = db.getRowsWhere("networkInterface", "LogicalIfName == '" .. L1_1 .. "'")
      for _FORV_19_, _FORV_20_ in pairs(ret) do
        L2_2 = _FORV_20_["networkInterface.interfaceName"]
        table = db.getRowsWhere("BandWidthProfileSpeed", "rowId != 0")
        for _FORV_24_, _FORV_25_ in pairs(table) do
          L5_5 = _FORV_25_["BandWidthProfileSpeed.Wan1Speed"]
          L4_4 = _FORV_25_["BandWidthProfileSpeed.Wan2Speed"]
          if (L12_12 == "DSR-1000N" or L12_12 .. "_" .. L14_14 == "DSR-1000_Ax" or L12_12 == "DSR-500N" or L12_12 == "DSR-500_Ax") and L1_1 == "WAN1" then
            os.execute(L6_6 .. "4")
            assert(assert(io.open("/tmp/portSpeed.4", "r")):close())
            if assert(io.open("/tmp/portSpeed.4", "r")):read(1) == "1" then
              L0_0 = "10Mb/s"
            elseif assert(io.open("/tmp/portSpeed.4", "r")):read(1) == "2" then
              L0_0 = "100Mb/s"
            elseif assert(io.open("/tmp/portSpeed.4", "r")):read(1) == "3" then
              L0_0 = "1000Mb/s"
            end
            if L5_5 == L0_0 then
            else
              db.setAttributeWhere("BandWidthProfileSpeed", "rowId != 0", "Wan1Speed", L0_0)
              bwLimitLib.bwLimitStatusRestart(L3_3)
            end
          else
            L0_0 = io.popen("/pfrm2.0/bin/ethtool" .. " " .. L2_2 .. "|grep Speed | awk '{print $2}'"):read("*a")
            io.popen("/pfrm2.0/bin/ethtool" .. " " .. L2_2 .. "|grep Speed | awk '{print $2}'"):close()
            L0_0 = string.gsub(L0_0, "\n", "")
            if L1_1 == "WAN1" then
              if L5_5 == L0_0 then
              else
                db.setAttributeWhere("BandWidthProfileSpeed", "rowId != 0", "Wan1Speed", L0_0)
                bwLimitLib.bwLimitStatusRestart(L3_3)
              end
            elseif L1_1 ~= "WAN2" or L4_4 == L0_0 then
            else
              db.setAttributeWhere("BandWidthProfileSpeed", "rowId != 0", "Wan2Speed", L0_0)
              bwLimitLib.bwLimitStatusRestart(L3_3)
            end
          end
        end
      end
    end
  end
  L7_7(L8_8)
end
