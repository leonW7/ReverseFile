module("com.teamf1.core.threeg.threeg_returnCodes", package.seeall)
THREEG_NOT_AVAILABLE = 2415984641
UNABLE_FETCH_MESSAGES = THREEG_NOT_AVAILABLE + 1
NO_MSG_FOUND = UNABLE_FETCH_MESSAGES + 1
NETWORK_ERROR = NO_MSG_FOUND + 1
SIM_BUSY = NETWORK_ERROR + 1
SIM_LOCKED = SIM_BUSY + 1
SIM_NOT_INSERTED = SIM_LOCKED + 1
SIM_CARD_BLOCKED = SIM_NOT_INSERTED + 1
SIM_WRONG_PIN = SIM_CARD_BLOCKED + 1
SIM_CARD_ERROR = SIM_WRONG_PIN + 1
returnCodesToString = {
  [THREEG_NOT_AVAILABLE] = "Mobile Internet is not available",
  [UNABLE_FETCH_MESSAGES] = "Unable to get SMS. Change WAN mode or disable Mobile Internet",
  [NO_MSG_FOUND] = "No messages found",
  [NETWORK_ERROR] = "Unable to read message, Please try again",
  [SIM_BUSY] = "Network is busy, Please try again",
  [SIM_LOCKED] = "SIM Card Locked",
  [SIM_NOT_INSERTED] = "SIM is not inserted inside the modem, please insert the sim and check again",
  [SIM_CARD_BLOCKED] = "SIM card is blocked",
  [SIM_WRONG_PIN] = "Wrong PIN entered",
  [SIM_CARD_ERROR] = "SIM card error occurred"
}
