local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6
L0_0(L1_1)
L0_0(L1_1)
scandir = L0_0
L0_0()
packages = L0_0
if L0_0 then
  if L0_0 > 0 then
    L0_0()
    for L3_3, L4_4 in L0_0(L1_1) do
      L5_5 = pkgMgmt
      L5_5 = L5_5.parseControlFile
      L6_6 = PKGMGMT_CTRL_DIR
      L6_6 = L6_6 .. L4_4 .. "/" .. CONTROL_FILE_NAME
      L5_5 = L5_5(L6_6)
      L6_6 = "insert into pkgInstalled (Package, Version, baseVersion, Depends, Description, status) values ('"
      L6_6 = L6_6 .. L4_4 .. "','" .. L5_5.Version .. "','" .. L5_5.Version .. "','" .. L5_5.Depends .. "','" .. L5_5.Description .. "','Installed')"
      db.execute(L6_6)
    end
    L0_0()
  end
end
