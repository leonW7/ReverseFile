module("com.teamf1.core.smtpClient.returnCodes", package.seeall)
SMTP_PORT_INVALID = 536936448
EMAIL_LOGS_INACTIVE = SMTP_PORT_INVALID + 1
LOGGING_EMAIL_PASSED = EMAIL_LOGS_INACTIVE + 1
LOGGING_EMAIL_FAILED = LOGGING_EMAIL_PASSED + 1
LOGGING_EMAIL_PASSED_CLEAR_FAILED = LOGGING_EMAIL_FAILED + 1
returnCodesToString = {
  [SMTP_PORT_INVALID] = "Invalid SMTP port number",
  [EMAIL_LOGS_INACTIVE] = "Please enable E-Mail Log",
  [LOGGING_EMAIL_PASSED] = "E-Mail with logs sent successfully and logs cleared",
  [LOGGING_EMAIL_FAILED] = "E-Mail with logs sending failed",
  [LOGGING_EMAIL_PASSED_CLEAR_FAILED] = "E-Mail with logs sent successfully but logs clear failed"
}
