local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7
L0_0 = require
L1_1 = "teamf1lualib/pkgMgmt"
L0_0(L1_1)
L0_0 = {}
L1_1 = {}
L2_2 = 1
for L6_6, L7_7 in L3_3(L4_4) do
  if string.sub(L7_7, 1, 1) == "-" then
    if string.find(L7_7, "=") then
      L0_0[string.sub(L7_7, 1, string.find(L7_7, "=") - 1)] = string.sub(L7_7, string.find(L7_7, "=") + 1)
    else
      L0_0[L7_7] = 1
    end
  else
    L1_1[L2_2] = L7_7
    L2_2 = L2_2 + 1
    L1_1.fileName = L7_7
  end
end
if L3_3 ~= 1 then
elseif L3_3 == "install" then
  return L3_3(L4_4)
end
