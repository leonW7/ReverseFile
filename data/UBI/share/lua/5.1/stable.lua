local L0_0
L0_0 = assert
L0_0 = L0_0(remotedostring, "There is no `remotedostring'.  Probably not in a slave state")
assert(L0_0("_state_persistent_table_ = _state_persistent_table_ or {}"))
module("stable")
_COPYRIGHT = "Copyright (C) 2004-2006 Kepler Project"
_DESCRIPTION = "State persistent table"
_VERSION = "Stable 1.0"
function get(A0_1)
  return _UPVALUE0_("return _state_persistent_table_[...]", A0_1)
end
function set(A0_2, A1_3)
  _UPVALUE0_("_state_persistent_table_[select(1,...)] = select(2,...)", A0_2, A1_3)
end
