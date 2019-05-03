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
    	    txtFieldIdArr[0] = "tf1_ipAddress, Please enter valid IP Address.";
    	    txtFieldIdArr[1] = "tf1_nameServer, Please enter valid Accounting Server Name .";
    	    txtFieldIdArr[2] = "tf1_portNumber, Please enter valid Port Number.";
    	    txtFieldIdArr[3] = "tf1_secret, Please enter valid Secret.";    	    
    
    	if (txtFieldArrayCheck(txtFieldIdArr) == false) 
            return false;
        
         if (ipv4Validate('tf1_ipAddress', 'IP', false, true, "Invalid IP address.", "for octet ", true) == false) 
             return false;
             
		if (alphaNumericValueCheck ("tf1_nameServer", "-", "invalid Server name ") == false)
		return false;
	
       	var interimObj = document.getElementById('tf1_portNumber');
    	if (interimObj && !interimObj.disabled) {
        if (numericValueRangeCheck(interimObj, 1, '', 1, 65535, true, "Invalid Interim Interval.", " in seconds.") == false) 
            return false;
            
            
        var txtFieldIdArr1 = new Array ();
		    txtFieldIdArr1[0] = "tf1_secret, Please enter valid Secret." ;
	if (isProblemCharArrayCheck(txtFieldIdArr1, "'\" ", NOT_SUPPORTED) == false) 
        return false;
		
		
    }
    setHiddenChks(frmId);
    return true;
}

