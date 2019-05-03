/*
 * File: captivePortalBillingProfile.js    
 * Created on 19th June 2013 - Bala Krishna G
 * Copyright (c) 2013 TeamF1, Inc.
 * All rights reserved.
 */
 /**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method loginProfilesValidate
 */
function paymentGatewayValidations(frmId) {
	var txtFieldIdArr = new Array();
	txtFieldIdArr[0] = "tf1_loginId, Please enter valid Login Id";
	txtFieldIdArr[1] = "tf1_transactionKey,Please enter valid Transaction Key";
	txtFieldIdArr[2] = "tf1_md5Hash,Please enter valid MD5 Hash";
	txtFieldIdArr[3] = "tf1_minimumOrderTotal,Please enter valid Minimum Order Total";
	txtFieldIdArr[4] = "tf1_maximumOrderTotal,Please enter valid Maximum Order Total";
	txtFieldIdArr[5] = "tf1_emailAddress,Please enter valid E-mail Address";
	txtFieldIdArr[6] = "tf1_apiUsername,Please enter valid Api Username";
	txtFieldIdArr[7] = "tf1_apiPassword,Please enter valid Api Password";
	txtFieldIdArr[8] = "tf1_apiSignature,Please enter valid Api Signature";
	txtFieldIdArr[9] = "tf1_installationId,Please enter valid Installation Id";
	txtFieldIdArr[10] = "tf1_authorizationPassword,Please enter Authorization Password";
	txtFieldIdArr[11] = "tf1_merchantId,Please enter valid Merchant Id";
	txtFieldIdArr[12] = "tf1_avsMode,Please enter valid Avs Mode";
	txtFieldIdArr[13] = "tf1_gatewayAlias,Please enter valid Gateway Alias";
    txtFieldIdArr[14] = "tf1_appID,Please enter APP ID";

	if (txtFieldArrayCheck(txtFieldIdArr) == false)
		return false;
		
		 
    if (echeck('tf1_emailAddress') == false) 
        return false;

	setHiddenChks(frmId);
	return true;
}
 
 
 /****
 * validate the E-mail Function
 * @method echeck
 */
function echeck(mailAddr){
    var mail = document.getElementById(mailAddr);
    if (mail.disabled) 
        return true;
    var str = mail.value;
    if (str == "") 
        return true;
    var message = "";
    var errFlag = true;
    var at = "@"
    var dot = "."
    var lat = str.indexOf(at)
    var lstr = str.length
    var ldot = str.indexOf(dot)
    var message = ""
    
    if (lat == -1) {
        message = "E-mail ID does not contain an '@' character";
        errFlag = false
    }
    
    else 
        if (lat == 0 || ((lat + 1) == lstr)) {
            message = "Invalid E-mail ID.'@' character should not be the first/last character";
            errFlag = false
        }
        
        else 
            if (ldot == -1) {
                message = "E-mail ID does not contain a '.' character";
                errFlag = false
            }
            
            else 
                if (ldot == 0 || ((ldot + 1) == lstr)) {
                    message = "Invalid E-mail ID.'.' character should not be the first/last character";
                    errFlag = false
                }
                
                else 
                    if (str.indexOf(at, (lat + 1)) != -1) {
                        message = "Invalid E-mail ID";
                        errFlag = false
                    }
                    
                    else 
                        if (str.substring(lat - 1, lat) == dot || str.substring(lat + 1, lat + 2) == dot) {
                            message = "Invalid E-mail ID";
                            errFlag = false
                        }
                        
                        else 
                            if (str.indexOf(dot, (lat + 2)) == -1) {
                                message = "Invalid E-mail ID";
                                errFlag = false
                            }
                            
                            else 
                                if (str.indexOf(" ") != -1) {
                                    message = "Invalid E-mail ID";
                                    errFlag = false
                                }
    var errFieldId = mailAddr + "Err";
    if (!errFlag) {
        alert(message);
    }
    
    return errFlag;
}
/**
 * Onload Call
*/ 
jQuery(function(){
    onloadCall();
    loginProfilesOnload();

});

/**
 * Wrapper function called onload
 * @method changeAutoRange
 * @param obj
 */
function loginProfilesOnload(){
   	var selValue = comboSelectedValueGet('tf1_paymentProcessor');
	if (!selValue)
		return;
	switch (selValue) {
    	case 'Authorize':
			/* Authorize  */
			fieldStateChangeWr('tf1_emailAddress tf1_apiUsername tf1_apiPassword tf1_apiSignature tf1_appID tf1_installationId tf1_authorizationPassword tf1_merchantId tf1_avsMode tf1_useTokenization tf1_gatewayAlias', '', 'tf1_loginId tf1_transactionKey tf1_md5Hash tf1_minimumOrderTotal tf1_maximumOrderTotal', 'tf1_TransactionServer tf1_TransactionMode tf1_sortOrder');
			vidualDisplay('tf1_emailAddress tf1_apiUsername tf1_apiPassword tf1_apiSignature tf1_appID tf1_installationId tf1_authorizationPassword tf1_merchantId tf1_avsMode tf1_useTokenization tf1_gatewayAlias', 'hide');
			
			vidualDisplay('break_emailAddress break_apiUsername break_apiPassword break_apiSignature  break_appID break_installationId break_authorizationPassword break_merchantId break_avsMode break_useTokenization break_gatewayAlias', 'hide');
			
			vidualDisplay('tf1_loginId tf1_transactionKey tf1_md5Hash tf1_minimumOrderTotal tf1_maximumOrderTotal tf1_TransactionServer tf1_TransactionMode tf1_sortOrder','configRow');
			vidualDisplay('break_loginId break_transactionKey break_md5Hash break_minimumOrderTotal break_maximumOrderTotal break_TransactionServer break_TransactionMode break_sortOrder', 'break');
			
			break;
			
			case 'Paypal':
			/* Paypal  */
			fieldStateChangeWr('tf1_loginId tf1_transactionKey tf1_md5Hash  tf1_minimumOrderTotal tf1_maximumOrderTotal tf1_installationId tf1_authorizationPassword tf1_merchantId tf1_avsMode tf1_useTokenization tf1_gatewayAlias','tf1_TransactionServer tf1_TransactionMode tf1_sortOrder','tf1_emailAddress tf1_apiUsername tf1_apiPassword tf1_apiSignature tf1_appID ','');
			vidualDisplay('tf1_loginId tf1_transactionKey tf1_md5Hash tf1_TransactionServer tf1_TransactionMode tf1_minimumOrderTotal tf1_maximumOrderTotal tf1_sortOrder tf1_installationId tf1_authorizationPassword tf1_merchantId tf1_avsMode tf1_useTokenization tf1_gatewayAlias', 'hide');
			vidualDisplay('break_loginId break_transactionKey break_md5Hash break_TransactionServer break_TransactionMode break_minimumOrderTotal break_maximumOrderTotal break_sortOrder break_installationId break_authorizationPassword break_merchantId break_avsMode break_useTokenization break_gatewayAlias', 'hide');
			
			vidualDisplay('tf1_emailAddress tf1_apiUsername tf1_apiPassword tf1_apiSignature tf1_appID','configRow');
			vidualDisplay('break_emailAddress break_apiUsername break_apiPassword break_apiSignature break_appID ','break');
			break;

            case 'PaypalTest':
			/* Paypal  */
			fieldStateChangeWr('tf1_loginId tf1_transactionKey tf1_md5Hash  tf1_minimumOrderTotal tf1_maximumOrderTotal tf1_installationId tf1_authorizationPassword tf1_merchantId tf1_avsMode tf1_useTokenization tf1_gatewayAlias','tf1_TransactionServer tf1_TransactionMode tf1_sortOrder','tf1_emailAddress tf1_apiUsername tf1_apiPassword tf1_apiSignature tf1_appID ','');
			vidualDisplay('tf1_loginId tf1_transactionKey tf1_md5Hash tf1_TransactionServer tf1_TransactionMode tf1_minimumOrderTotal tf1_maximumOrderTotal tf1_sortOrder tf1_installationId tf1_authorizationPassword tf1_merchantId tf1_avsMode tf1_useTokenization tf1_gatewayAlias', 'hide');
			vidualDisplay('break_loginId break_transactionKey break_md5Hash break_TransactionServer break_TransactionMode break_minimumOrderTotal break_maximumOrderTotal break_sortOrder break_installationId break_authorizationPassword break_merchantId break_avsMode break_useTokenization break_gatewayAlias', 'hide');
			
			vidualDisplay('tf1_emailAddress tf1_apiUsername tf1_apiPassword tf1_apiSignature tf1_appID','configRow');
			vidualDisplay('break_emailAddress break_apiUsername break_apiPassword break_apiSignature break_appID ','break');
			break;
			
			case 'SecurePay':
			/* SecurePay  */
			fieldStateChangeWr('tf1_loginId tf1_transactionKey tf1_md5Hash tf1_minimumOrderTotal tf1_maximumOrderTotal tf1_emailAddress tf1_apiUsername tf1_apiPassword tf1_apiSignature tf1_appID tf1_installationId tf1_authorizationPassword','tf1_sortOrder tf1_TransactionServer tf1_TransactionMode','tf1_merchantId tf1_avsMode tf1_useTokenization tf1_gatewayAlias','');
			vidualDisplay('tf1_loginId tf1_transactionKey tf1_md5Hash tf1_TransactionServer tf1_TransactionMode tf1_minimumOrderTotal tf1_maximumOrderTotal tf1_sortOrder tf1_emailAddress tf1_apiUsername tf1_apiPassword tf1_apiSignature tf1_appID tf1_installationId tf1_authorizationPassword', 'hide');
			
			vidualDisplay('break_loginId break_transactionKey break_md5Hash break_TransactionServer break_TransactionMode break_minimumOrderTotal break_maximumOrderTotal break_sortOrder break_emailAddress break_apiUsername break_apiPassword break_apiSignature break_appID break_installationId break_authorizationPassword', 'hide');
			
			vidualDisplay('tf1_merchantId tf1_avsMode tf1_useTokenization tf1_gatewayAlias', 'configRow');
			vidualDisplay('break_merchantId break_avsMode break_useTokenization break_gatewayAlias', 'break');
			break;
			
			case 'WorldPay':
			/* WorldPay  */
			fieldStateChangeWr('tf1_loginId tf1_transactionKey tf1_md5Hash tf1_minimumOrderTotal tf1_maximumOrderTotal tf1_emailAddress tf1_apiUsername tf1_apiPassword tf1_apiSignature tf1_appID tf1_merchantId tf1_avsMode tf1_useTokenization tf1_gatewayAlias','tf1_TransactionServer tf1_TransactionMode tf1_sortOrder',' tf1_installationId tf1_authorizationPassword','');
			vidualDisplay('tf1_loginId tf1_transactionKey tf1_md5Hash tf1_TransactionServer tf1_TransactionMode tf1_minimumOrderTotal tf1_maximumOrderTotal tf1_sortOrder tf1_emailAddress tf1_apiUsername tf1_apiPassword tf1_apiSignature tf1_appID tf1_installationId  tf1_merchantId tf1_avsMode tf1_useTokenization tf1_gatewayAlias', 'hide');
			vidualDisplay('break_loginId break_transactionKey break_md5Hash break_TransactionServer break_TransactionMode break_minimumOrderTotal break_maximumOrderTotal break_sortOrder break_emailAddress break_apiUsername break_apiPassword break_apiSignature break_appID break_merchantId break_avsMode break_useTokenization break_gatewayAlias', 'hide');
			
			vidualDisplay('tf1_installationId tf1_authorizationPassword', 'configRow');
			vidualDisplay('break_installationId break_authorizationPassword', 'break');
			break;
	
    }
}
