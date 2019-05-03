require("smsLib")
require("teamf1lualib/db")
sms = {}
function sms.Inbox()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9
  L0_0 = "/dev/modem"
  L1_1 = 0
  L2_2 = nil
  L3_3 = "#q92679@"
  L4_4 = nil
  L5_5 = smsLib
  L5_5 = L5_5.smsInboxGet
  L6_6 = L0_0
  L5_5 = L5_5(L6_6)
  L6_6 = string
  L6_6 = L6_6.len
  L7_7 = L5_5
  L6_6 = L6_6(L7_7)
  L4_4 = L6_6
  if L5_5 == "0" then
    L6_6 = "OK"
    L7_7 = nil
    L8_8 = "11487"
    return L6_6, L7_7, L8_8
  elseif L5_5 == "2620" then
    L6_6 = "ERROR"
    L7_7 = nil
    L8_8 = "11487"
    return L6_6, L7_7, L8_8
  elseif L5_5 == "2029" then
    L6_6 = "ERROR"
    L7_7 = nil
    L8_8 = "11487"
    return L6_6, L7_7, L8_8
  end
  L6_6 = string
  L6_6 = L6_6.len
  L7_7 = L3_3
  L6_6 = L6_6(L7_7)
  L6_6 = L6_6 + 1
  if L4_4 < L6_6 then
    L6_6 = "ERROR"
    L7_7 = nil
    L8_8 = "11487"
    return L6_6, L7_7, L8_8
  end
  L6_6 = {}
  L7_7 = string
  L7_7 = L7_7.find
  L8_8 = L5_5
  L9_9 = L3_3
  L8_8 = L7_7(L8_8, L9_9)
  L2_2 = L8_8
  L4_4 = L7_7
  while L2_2 do
    L7_7 = string
    L7_7 = L7_7.sub
    L8_8 = L5_5
    L9_9 = 1
    L7_7 = L7_7(L8_8, L9_9, L2_2)
    L1_1 = L1_1 + 1
    L8_8 = {}
    L6_6[L1_1] = L8_8
    L8_8 = 0
    while L8_8 < 5 do
      L9_9 = string
      L9_9 = L9_9.find
      L9_9 = L9_9(L7_7, "*")
      L8_8 = L8_8 + 1
      if L8_8 == 1 then
        L6_6[L1_1].Sno = string.sub(L7_7, 1, L9_9 - 1)
      elseif L8_8 == 2 then
        L6_6[L1_1].mode = string.sub(L7_7, 1, L9_9 - 1)
      elseif L8_8 == 3 then
        L6_6[L1_1].Sender = string.sub(L7_7, 1, L9_9 - 1)
      elseif L8_8 == 4 then
        L6_6[L1_1].Time = string.sub(L7_7, 1, L9_9 - 1)
      else
        L9_9 = string.find(L7_7, L3_3)
        L6_6[L1_1].Text = string.sub(L7_7, 1, L9_9 - 1)
      end
      L7_7 = string.sub(L7_7, L9_9 + 1)
    end
    L9_9 = string
    L9_9 = L9_9.sub
    L9_9 = L9_9(L5_5, L2_2 + 1)
    L5_5 = L9_9
    L9_9 = string
    L9_9 = L9_9.len
    L9_9 = L9_9(L5_5)
    if L9_9 == 0 then
      L9_9 = string
      L9_9 = L9_9.len
      L9_9 = L9_9(L6_6[L1_1].Text)
      L9_9 = L9_9 - 4
      if L9_9 < 0 then
        L6_6[L1_1].Text = ""
        break
      else
        L6_6[L1_1].Text = string.sub(L6_6[L1_1].Text, 1, L9_9)
        break
      end
    end
    L9_9 = string
    L9_9 = L9_9.find
    L2_2, L9_9 = L5_5, L9_9(L5_5, L3_3)
    L4_4 = L9_9
  end
  L7_7 = "OK"
  L8_8 = L6_6
  L9_9 = "11486"
  return L7_7, L8_8, L9_9
end
function sms.delete(A0_10)
  local L1_11
  L1_11 = "/dev/modem"
  if smsLib.smsDelete(L1_11, A0_10["1"]) == "OK" then
    return "OK", "12164"
  else
    return "ERROR", "12165"
  end
end
function sms.createMsg(A0_12)
  local L1_13, L2_14, L3_15
  L1_13 = "/dev/modem"
  L2_14 = A0_12["smsCreate.receiver"]
  L3_15 = A0_12["smsCreate.text"]
  if smsLib.smsCreate(L1_13, L2_14, L3_15) == "OK" then
    return "OK", "12168"
  else
    return "ERROR", "12167"
  end
end
function sms.getId(A0_16, A1_17)
  local L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24
  L2_18 = sms
  L2_18 = L2_18.Inbox
  L3_19 = L2_18()
  if L2_18 == "OK" then
    for L7_23, L8_24 in L4_20(L5_21) do
      if tonumber(L8_24.Sno) == tonumber(A0_16) then
        return "OK", L8_24
      end
    end
  else
    return L4_20, L5_21
  end
end
