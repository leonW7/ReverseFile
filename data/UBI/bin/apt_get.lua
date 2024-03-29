local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8
L0_0 = require
L1_1 = "teamf1lualib/pkgMgmt"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/db"
L0_0(L1_1)
L0_0 = {}
L1_1 = {}
L2_2 = {}
L3_3 = 1
for L7_7, L8_8 in L4_4(L5_5) do
  if string.sub(L8_8, 1, 1) == "-" then
    L1_1[L8_8] = 1
  else
    L2_2[L3_3] = L8_8
    L3_3 = L3_3 + 1
  end
end
commandAdd = L5_5
function L7_7()
  local L0_9, L1_10, L2_11, L3_12, L4_13, L5_14, L6_15, L7_16, L8_17, L9_18, L10_19, L11_20, L12_21
  L0_9 = ""
  L1_10 = db
  L1_10 = L1_10.getTable
  L2_11 = "pkgInstalled"
  L1_10 = L1_10(L2_11, L3_12)
  L2_11 = 0
  for L6_15, L7_16 in L3_12(L4_13) do
    if L6_15 > 1 then
      for L11_20, L12_21 in L8_17(L9_18) do
        if L7_16 == L12_21.Package then
          if pkgMgmt.remove(L7_16, L12_21) == "error" then
            pkgMgmt.log(ERROR, "failed in removing package " .. L7_16)
            break
          end
          L2_11 = 1
          L0_9 = L0_9 .. L7_16 .. " "
        end
      end
      if L2_11 == 0 then
        L8_17(L9_18)
      else
        L8_17(L9_18)
      end
    end
  end
end
L8_8 = commandAdd
L8_8("update", L5_5)
L8_8 = commandAdd
L8_8("install", L6_6)
L8_8 = commandAdd
L8_8("remove", L7_7)
L8_8 = L2_2[1]
if L8_8 then
  L8_8 = L2_2[1]
  L8_8 = L0_0[L8_8]
  if L8_8 then
    L8_8 = L1_1["-d"]
    if L8_8 then
      L8_8 = pkgMgmt
      L8_8 = L8_8.logStdoutEnable
      L8_8(true)
    end
    L8_8 = pkgMgmt
    L8_8 = L8_8.pkgdbConnect
    L8_8()
    L8_8 = L2_2[1]
    L8_8 = L0_0[L8_8]
    L8_8()
  end
else
  L8_8 = print
  L8_8([[
 
Commands: 
   update - Retrieve new lists of packages 
   install - Install new packages (pkg is libc6 not libc6.deb) 
   remove - Remove packages 
 
Options: 
  -d    show log messages on console 
  --download-only  
        Download only - do NOT install or unpack archives 
  --no-upgrade 
        Do not upgrade packages if already installed; used with install command. 
  --reinstall 
        Re-Install packages that are already installed and at the newest version. 
        ]])
end
