local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6
L0_0 = require
L1_1 = "teamf1lualib/util"
L0_0(L1_1)
L0_0, L1_1 = nil, nil
L2_2 = "/tmp/hwFamilyVersion"
L3_3 = "Ax"
L4_4 = arg
L1_1 = L4_4[1]
curHwFamily = L3_3
L4_4 = string
L4_4 = L4_4.sub
L5_5 = curHwFamily
L6_6 = 1
L4_4 = L4_4(L5_5, L6_6, 1)
L5_5 = string
L5_5 = L5_5.sub
L6_6 = L1_1
L5_5 = L5_5(L6_6, 1, 1)
if L4_4 == L5_5 then
  L4_4 = "Ax"
  curHwFamily = L4_4
else
  L4_4 = "Bx"
  curHwFamily = L4_4
end
L4_4 = io
L4_4 = L4_4.open
L5_5 = L2_2
L6_6 = "w"
L4_4 = L4_4(L5_5, L6_6)
L0_0 = L4_4
if L0_0 ~= nil then
  L5_5 = L0_0
  L4_4 = L0_0.write
  L6_6 = curHwFamily
  L4_4(L5_5, L6_6)
  L5_5 = L0_0
  L4_4 = L0_0.close
  L4_4(L5_5)
end
L4_4 = require
L5_5 = "teamf1lualib/util"
L4_4(L5_5)
L4_4, L5_5 = nil, nil
L6_6 = "/tmp/hwFamilyVersion"
curHwFamily, L5_5 = "Ax", arg[1]
if string.sub(curHwFamily, 1, 1) == string.sub(L5_5, 1, 1) then
  curHwFamily = "Ax"
else
  curHwFamily = "Bx"
end
L4_4 = io.open(L6_6, "w")
if L4_4 ~= nil then
  L4_4:write(curHwFamily)
  L4_4:close()
end
