/*
 * File: adServer.js
 * Created on 23rd nov 2012 - Laxmi
 * Modifield on 5th Feb 2015 - Ramakrishna Reddy P.M
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */

/* While loading the page below part of code will execute */
$(document).ready (function (){
    var checkNow = $("#checkNowId").val ();

    if (checkNow == "1")
        {
            serverStatusWr ('activeDirectory');
        }
});

/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method adServerValidate
 */
function adServerValidate(){
    var txtFieldIdArr = new Array();
    
    txtFieldIdArr[0] = "tf1_activeAuthServer1,"+LANG_LOCALE['11973'];
    txtFieldIdArr[1] = "tf1_activeDirectoryDomain1,"+LANG_LOCALE['12001'];
    txtFieldIdArr[2] = "tf1_txtTimeOut,"+LANG_LOCALE['12136'];
    txtFieldIdArr[3] = "tf1_txtRetries,"+LANG_LOCALE['12103'];
    txtFieldIdArr[4] = "tf1_firstServHostname,"+LANG_LOCALE['30609'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
    
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_activeAuthServer2,"+LANG_LOCALE['11232'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_activeAuthServer3,"+LANG_LOCALE['11232'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_activeDirectoryDomain2,"+LANG_LOCALE['11232'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_activeDirectoryDomain3,"+LANG_LOCALE['11232'];
    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    if (ipv4Validate('tf1_activeAuthServer1', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;

    var authServerObj = document.getElementById('tf1_activeAuthServer2');
    
    if(authServerObj && authServerObj.value != "")
        {    
    		if (ipv4Validate('tf1_activeAuthServer2', 'IP', true, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        	return false;
		}

    authServerObj = document.getElementById('tf1_activeAuthServer3');
    
    if(authServerObj && authServerObj.value != "")
        {    
    		if (ipv4Validate('tf1_activeAuthServer3', 'IP', true, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
       	 	return false;
		}

	if (alphaNumericValueCheck ("tf1_activeDirectoryDomain1", "!@#$%^&()-_'{}.~", LANG_LOCALE['30272']+":") == false)
		return false;
    
    var txtSecondActiveDrDomainObj = document.getElementById ('tf1_activeDirectoryDomain2');
    if(txtSecondActiveDrDomainObj && (txtSecondActiveDrDomainObj.value != ""))
        {
        if (alphaNumericValueCheck ("tf1_activeDirectoryDomain2", "!@#$%^&()-_'{}.~", LANG_LOCALE['30273']+":") == false)
		    return false;
		    
		if (!isSameValue ('tf1_activeDirectoryDomain1', 'tf1_activeDirectoryDomain2', LANG_LOCALE['30274']))
		    {
		    return false;
		    }
		    
		if (!isSameValue ('tf1_activeDirectoryDomain3', 'tf1_activeDirectoryDomain2', LANG_LOCALE['30275']))
		    {
		    return false;
		    }
		}
		
    var txtThirdActiveDrDomainObj = document.getElementById ('tf1_activeDirectoryDomain3');
    if(txtThirdActiveDrDomainObj && (txtThirdActiveDrDomainObj.value != ""))
        {
        if (alphaNumericValueCheck ("tf1_activeDirectoryDomain3", "!@#$%^&()-_'{}.~", LANG_LOCALE['30276']+":") == false)
			return false;
			
	    if (!isSameValue ('tf1_activeDirectoryDomain1', 'tf1_activeDirectoryDomain3', LANG_LOCALE['30277']))
		    {
		    return false;
		    }
		}
	
	if ( !isDependent (['tf1_activeAuthServer1', 'tf1_activeDirectoryDomain1'], LANG_LOCALE['30278'] ) ) {
         return false;   
    }
    
    if ( !isDependent (['tf1_activeAuthServer2', 'tf1_activeDirectoryDomain2'], LANG_LOCALE['30279'] ) ) {
         return false;   
    }
    
    if ( !isDependent (['tf1_activeAuthServer3', 'tf1_activeDirectoryDomain3'], LANG_LOCALE['30280'] ) ) {
         return false;   
    }
	
    var timeObj = document.getElementById ('tf1_txtTimeOut');
    if (timeObj)
        {
            if (numericValueRangeCheck1 (timeObj, '', '', 1, true, LANG_LOCALE['30406']+":", '') == false)
                return false;
        }

    var retriObj = document.getElementById ('tf1_txtRetries');
    if (retriObj)
        {
            if (numericValueRangeCheck1 (retriObj, '', '', 5, true, LANG_LOCALE['30407']+":", '') == false)
                return false;
        }
    
    var combinedValue = (document.getElementById('tf1_txtTimeOut').value) * (document.getElementById('tf1_txtRetries').value);
    if (combinedValue > 30)
        {
            alert(LANG_LOCALE['30256']);
            return false;
        }

    return true;
    
}

/*
Function: isSameValue
Purpose: Check if value of first field is equal to second field 
params: 1. firstId - first field Id
        2. secondId - second fieldId
Returns: true/false
*/
function isSameValue (firstId, secondId, msg) {
    var firstIdObj = document.getElementById (firstId);
    var secondIdObj = document.getElementById (secondId);    
    if (firstIdObj && !firstIdObj.disabled && secondIdObj && !secondIdObj.disabled) {
        if (firstIdObj.value == secondIdObj.value) {
            firstIdObj.focus ();
            alert (msg);
            return false;
        }
    }
    return true;
}
