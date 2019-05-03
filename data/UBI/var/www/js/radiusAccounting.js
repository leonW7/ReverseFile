/*
 * File: radiusAccountingConfig.js
 * Created on 4th Dec 2013 - Ramakrishna PM
 * Copyright (c) 2013 TeamF1, Inc.
 * All rights reserved.
 */
/**
 * This function calls when user clicks on submit button
 * On submit validation
 * @method radiusConfValidate
 */
/**
 	* This function calls when user clicks on submit button
	* On submit validation
 	* @method upnpConfValidate
 	*/
	function radiusAccConfigValidate(frmId){

	var txtFieldIdArr = new Array();
    	    txtFieldIdArr[0] = "tf1_ipAddress, "+LANG_LOCALE['12290'];
    	    txtFieldIdArr[1] = "tf1_nameServer, "+LANG_LOCALE['12201'];
    	    txtFieldIdArr[2] = "tf1_portNumber, "+LANG_LOCALE['12336'];
    	    txtFieldIdArr[3] = "tf1_secret, "+LANG_LOCALE['12372'];    	    
    
    	if (txtFieldArrayCheck(txtFieldIdArr) == false) 
            return false;
        
         if (ipv4Validate('tf1_ipAddress', 'IP', false, true, LANG_LOCALE['11281']+".", LANG_LOCALE['11031']+" ", true) == false) 
             return false;
             
		if (alphaNumericValueCheck ("tf1_nameServer", "-", LANG_LOCALE['11349']+" ") == false)
		return false;
	
       	var interimObj = document.getElementById('tf1_portNumber');
    	if (interimObj && !interimObj.disabled) {
        if (numericValueRangeCheck(interimObj, 1, '', 1, 65535, true, LANG_LOCALE['11278']+".", LANG_LOCALE['11167']+" ") == false) 
            return false;
            
            
        var txtFieldIdArr1 = new Array ();
		    txtFieldIdArr1[0] = "tf1_secret, "+LANG_LOCALE['12372'] ;
	if (isProblemCharArrayCheck(txtFieldIdArr1, "'\" ", NOT_SUPPORTED) == false) 
        return false;
		
		
    }
    setHiddenChks(frmId);
    return true;
}

