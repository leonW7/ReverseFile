module("com.teamf1.core.libupnp.returnCodes", package.seeall)
ADVERTISEMENT_PERIOD_INVALID = 654376960
ADVERTISEMENT_TIME_TOLIVE_INVALID = ADVERTISEMENT_PERIOD_INVALID + 1
returnCodesToString = {
  [ADVERTISEMENT_PERIOD_INVALID] = "Invalid value in advertisement period field",
  [ADVERTISEMENT_TIME_TOLIVE_INVALID] = "Invalid value in time-to-live field"
}
