local L0_0
L0_0 = module
L0_0("com.teamf1.core.ipsec.export", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/vipsecure_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.vipsecure.returnCodes")
function exportPolicy(A0_1, A1_2, A2_3)
  local L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11
  if not A2_3 then
    L3_4 = _UPVALUE0_
    L3_4 = L3_4.VIPSECURE_EXPORTFILE_OPEN_FAILED
    return L3_4
  end
  L3_4 = db
  L3_4 = L3_4.getColNames
  L4_5 = A0_1
  L3_4 = L3_4(L4_5)
  L4_5 = db
  L4_5 = L4_5.getDefaults
  L5_6 = false
  L4_5 = L4_5(L5_6, L6_7)
  L5_6 = A2_3.write
  L5_6(L6_7, L7_8)
  L5_6 = A0_1
  L5_6 = L5_6 .. L6_7
  L9_10 = "\n"
  L6_7(L7_8, L8_9)
  for L9_10, L10_11 in L6_7(L7_8) do
    if L10_11 == "_ROWID_" then
    elseif util.tableKeyExists(A1_2, A0_1 .. "." .. L10_11) then
      L5_6 = A0_1 .. "[1][\"" .. L10_11 .. "\"] = \"" .. A1_2[A0_1 .. "." .. L10_11] .. "\""
      A2_3:write(L5_6 .. "\n")
    elseif L4_5[A0_1 .. "." .. L10_11] then
      L5_6 = A0_1 .. "[1][\"" .. L10_11 .. "\"] = \"" .. L4_5[A0_1 .. "." .. L10_11] .. "\""
      A2_3:write(L5_6 .. "\n")
    end
  end
  return L6_7
end
