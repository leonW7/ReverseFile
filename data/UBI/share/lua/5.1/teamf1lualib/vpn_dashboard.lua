local L0_0
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = "/tmp/system.db"
db.connect(L0_0)
function vpnRecordsGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25
  L0_1 = db
  L0_1 = L0_1.getTable
  L1_2 = "vpnDataHistory"
  L0_1 = L0_1(L1_2)
  L1_2 = 1
  _UPVALUE0_ = L1_2
  L1_2 = 1
  L2_3 = 2
  L3_4 = {}
  for L7_8, L8_9 in L4_5(L5_6) do
    for L12_13, L13_14 in L9_10(L10_11) do
      if L12_13 == "vpnDataHistory.time" then
        L3_4[L14_15] = L13_14
        _UPVALUE0_ = L14_15
      end
    end
  end
  if L4_5 > 0 then
    L4_5(L5_6)
    _UPVALUE1_ = L4_5
    L7_8 = {}
    L8_9 = {}
    L12_13 = nil
    for L16_17, L17_18 in L13_14(L14_15) do
      L18_19 = _UPVALUE1_
      L19_20 = db
      L19_20 = L19_20.getRow
      L19_20 = L19_20(L20_21, L21_22, L22_23)
      L4_5[L18_19] = L19_20
      L18_19 = _UPVALUE1_
      L19_20 = _UPVALUE1_
      L19_20 = L4_5[L19_20]
      L19_20 = L19_20["vpnDataHistory.sslvpnUser"]
      L5_6[L18_19] = L19_20
      L18_19 = _UPVALUE1_
      L19_20 = _UPVALUE1_
      L19_20 = L4_5[L19_20]
      L19_20 = L19_20["vpnDataHistory.activeSslvpnUser"]
      L6_7[L18_19] = L19_20
      L18_19 = _UPVALUE1_
      L19_20 = _UPVALUE1_
      L19_20 = L4_5[L19_20]
      L19_20 = L19_20["vpnDataHistory.clientTunnels"]
      L7_8[L18_19] = L19_20
      L18_19 = _UPVALUE1_
      L19_20 = _UPVALUE1_
      L19_20 = L4_5[L19_20]
      L19_20 = L19_20["vpnDataHistory.gatewayTunnels"]
      L8_9[L18_19] = L19_20
      L18_19 = _UPVALUE1_
      L19_20 = _UPVALUE1_
      L19_20 = L4_5[L19_20]
      L19_20 = L19_20["vpnDataHistory.activeClientTunnels"]
      L9_10[L18_19] = L19_20
      L18_19 = _UPVALUE1_
      L19_20 = _UPVALUE1_
      L19_20 = L4_5[L19_20]
      L19_20 = L19_20["vpnDataHistory.activeGatewayTunnels"]
      L10_11[L18_19] = L19_20
      L18_19 = ":"
      L19_20 = os
      L19_20 = L19_20.date
      L19_20 = L19_20(L20_21, L21_22)
      for L23_24, L24_25 in L20_21(L21_22) do
        if L23_24 == "hour" then
          L11_12[_UPVALUE1_] = L24_25
        end
        if L23_24 == "min" then
          L11_12[_UPVALUE1_] = L11_12[_UPVALUE1_] .. L18_19 .. L24_25
        end
      end
      _UPVALUE1_ = L20_21
    end
    L13_14.sslvpnUser = L14_15
    L13_14.activeSslvpnUser = L14_15
    L13_14.clientTunnels = L14_15
    L13_14.gatewayTunnels = L14_15
    L13_14.activeClientTunnels = L14_15
    L13_14.activeGatewayTunnelsTable = L14_15
    L16_17 = L9_10
    L17_18 = L10_11
    L18_19 = L11_12
    L19_20 = L13_14
    return L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21
  else
    return L4_5
  end
end
