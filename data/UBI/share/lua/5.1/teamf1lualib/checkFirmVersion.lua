local L1_0
function L1_0(A0_1)
  if string.find(A0_1, "<Firmware_Check_Error>") then
    error1, error2, errorMsg = string.find(A0_1, "<ErrorMessage>(.-)</ErrorMessage>")
    return 1, errorMsg, 1, 1, 1, 1
  else
    dummy1, dummy2, majorVer = string.find(A0_1, "<Major>(.-)</Major>")
    dummy1, dummy2, minorVer = string.find(A0_1, "<Minor>(.-)</Minor>")
    dummy1, dummy2, buildCode = string.find(A0_1, "<BuildCode>(.-)</BuildCode>")
    dummy1, dummy2, dummy3, Link, dummy4 = string.find(A0_1, "<Global>(.-)<Firmware>(.-)</Firmware>(.-)</Global>")
    dummy1, dummy2, dummy3, Notes, dummy4 = string.find(A0_1, "<Global>(.-)<Release_Note>(.-)</Release_Note>(.-)</Global>")
    return 0, majorVer, minorVer, Link, buildCode, Notes
  end
end
getVersion = L1_0
