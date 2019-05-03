/*
 * File: radiusAccountingCfg.js
 * Created on 07th Sep 2016 - Ramakrishna Reddy P.M.
 * mCopyright (c) 2013-2016, TeamF1 Networks Pvt. Ltd. 
 * (Subsidiary of D-Link India) 
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
 	* @method radiusAccConfigValidate
 	*/
function radiusAccConfigValidate(frmId){

	var txtFieldIdArr = new Array();
    	    txtFieldIdArr[0] = "tf1_ServerIPAddress1, "+LANG_LOCALE['12290'];
    	    txtFieldIdArr[1] = "tf1_portNumber1, "+LANG_LOCALE['12336'];
    	    txtFieldIdArr[2] = "tf1_secret1, "+LANG_LOCALE['12372'];    	    
    	    txtFieldIdArr[3] = "tf1_ServerIPAddress2, "+LANG_LOCALE['12290'];
    	    txtFieldIdArr[4] = "tf1_portNumber2, "+LANG_LOCALE['12336'];
    	    txtFieldIdArr[5] = "tf1_secret2, "+LANG_LOCALE['12372'];    	    
    	    txtFieldIdArr[6] = "tf1_ServerIPAddress3, "+LANG_LOCALE['12290'];
    	    txtFieldIdArr[7] = "tf1_portNumber3, "+LANG_LOCALE['12336'];
    	    txtFieldIdArr[8] = "tf1_secret3, "+LANG_LOCALE['12372'];    	    
    
    	if (txtFieldArrayCheck(txtFieldIdArr) == false) 
            return false;
        
        if (ipv4Validate('tf1_ServerIPAddress1', 'IP', false, true, LANG_LOCALE['11281']+".", LANG_LOCALE['11031']+" ", true) == false) 
            return false;
             
        if (ipv4Validate('tf1_ServerIPAddress2', 'IP', false, true, LANG_LOCALE['11281']+".", LANG_LOCALE['11031']+" ", true) == false) 
            return false;
             
        if (ipv4Validate('tf1_ServerIPAddress3', 'IP', false, true, LANG_LOCALE['11281']+".", LANG_LOCALE['11031']+" ", true) == false) 
            return false;
             
       	var portNumberObj1 = document.getElementById('tf1_portNumber1');
    	if (portNumberObj1 && !portNumberObj1.disabled) {
            if (numericValueRangeCheck(portNumberObj1, 1, '', 0, 65535, true, LANG_LOCALE['11315']+".", "") == false) 
                return false;
        }
            
       	var portNumberObj2 = document.getElementById('tf1_portNumber2');
    	if (portNumberObj2 && !portNumberObj2.disabled) {
            if (numericValueRangeCheck(portNumberObj2, 1, '', 0, 65535, true, LANG_LOCALE['11315']+".", "") == false) 
                return false;
        }
            
       	var portNumberObj3 = document.getElementById('tf1_portNumber3');
    	if (portNumberObj3 && !portNumberObj3.disabled) {
            if (numericValueRangeCheck(portNumberObj3, 1, '', 0, 65535, true, LANG_LOCALE['11315']+".", "") == false) 
                return false;
        }
            
        /*var txtFieldIdArr1 = new Array ();
		    txtFieldIdArr1[0] = "tf1_secret, Please enter valid Secret." ;
	    if (isProblemCharArrayCheck(txtFieldIdArr1, "'\" ", NOT_SUPPORTED) == false) 
        return false;*/
		
    setHiddenChks(frmId);
    return true;
}


