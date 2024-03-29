module("com.teamf1.core.certificates.returnCodes", package.seeall)
X509_COOKIE_INVALID = 604045313
X509_IPADDRESS_INVALID = X509_COOKIE_INVALID + 1
X509_CERT_HASH_INVALID = X509_IPADDRESS_INVALID + 1
X509_INVALID_SELF = X509_CERT_HASH_INVALID + 1
X509_INVALID_SELF_CA = X509_INVALID_SELF + 1
X509_INVALID_SELF_PURPOSE = X509_INVALID_SELF_CA + 1
CANNTOT_DEL_USED_CERT = X509_INVALID_SELF_PURPOSE + 1
X509_CANNOT_DEL_TRUSTED = CANNTOT_DEL_USED_CERT + 1
X509_SELF_CERT_ALREADY_EXIST = X509_CANNOT_DEL_TRUSTED + 1
X509_SELF_CERT_REQ_ALREADY_EXIST = X509_SELF_CERT_ALREADY_EXIST + 1
X509_SELF_CERT_CHANGED = X509_SELF_CERT_REQ_ALREADY_EXIST + 1
X509_CANNOT_DEL_USED_SELF_CERT_REQ = X509_SELF_CERT_CHANGED + 1
returnCodesToString = {
  [X509_COOKIE_INVALID] = "cookie is invalid",
  [X509_IPADDRESS_INVALID] = "x509 IP Address Is Invalid",
  [X509_CERT_HASH_INVALID] = "x509 certificate is invalid",
  [X509_INVALID_SELF] = "x509 self certificate is invalid",
  [X509_INVALID_SELF_CA] = "No trusted certificate found, Cannot Upload Self Certificate",
  [X509_INVALID_SELF_PURPOSE] = "x509 self puropse is invalid",
  [CANNTOT_DEL_USED_CERT] = "Cannot Delete Trusted CA as it is being used by other self signed certificate(s)",
  [X509_CANNOT_DEL_TRUSTED] = "Cannot Delete Trusted CAs",
  [X509_SELF_CERT_ALREADY_EXIST] = "x509 certificate subject name already exists",
  [X509_SELF_CERT_REQ_ALREADY_EXIST] = "x509 certificate request name already exists",
  [X509_SELF_CERT_CHANGED] = "certificate has been changed please wait for 60 seconds",
  [X509_CANNOT_DEL_USED_SELF_CERT_REQ] = "Cannot Delete Self Certificate Request as it is being used by Active Self certificates"
}
