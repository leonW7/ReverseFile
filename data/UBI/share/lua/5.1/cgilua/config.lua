local L0_0
L0_0 = require
L0_0("cgilua.session")
L0_0 = cgilua
L0_0 = L0_0.session
L0_0 = L0_0.setsessiondir
L0_0("/tmp/")
L0_0 = false
function cgilua.enablesession()
  if _UPVALUE0_ then
    return
  else
    _UPVALUE0_ = true
  end
  cgilua.session.open()
  cgilua.addclosefunction(cgilua.session.close)
end
cgilua.preprocess = cgilua.handlelp
cgilua.includehtml = cgilua.lp.include
cgilua.addopenfunction(function()
  local L0_1, L1_2
  L0_1 = _UPVALUE0_
  L1_2 = cgilua
  L1_2 = L1_2.script_vdir
  L0_1 = L0_1[L1_2]
  if L0_1 then
    L1_2 = _UPVALUE1_
    L1_2.path = L0_1 .. "/?.lua;" .. _UPVALUE1_.path
  end
end)
