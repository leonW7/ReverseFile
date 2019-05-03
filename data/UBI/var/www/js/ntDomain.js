/*
* File: ntDomain.js
* Created on 28th Nov 2012 - Laxmi
* Modified on 5th Feb 2015 - Ramakrishna Reddy
* Copyright (c) 2012 TeamF1, Inc.
* All rights reserved.
*/

/* While loading the page below part of code will execute */
$(document).ready (function (){
    var checkNow = $("#checkNowId").val ();

    if (checkNow == "1")
        {
            serverStatusWr ('ntDomain');
        }
});


/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method nrDomainValidate
 */
function nrDomainValidate() {
	var txtFieldIdArr = new Array();
	txtFieldIdArr[0] = "tf1_ldapAuthServer1,"+LANG_LOCALE['12225']+1;
	txtFieldIdArr[1] = "tf1_wordGroup1,"+LANG_LOCALE['12419'];
	txtFieldIdArr[2] = "tf1_ldapTimeout,"+LANG_LOCALE['12407'];
	txtFieldIdArr[3] = "tf1_ldapRetries,"+LANG_LOCALE['12362'];

    var txtFieldArrNt = new Array();
    txtFieldArrNt[0] = "tf1_wordGroup1,"+LANG_LOCALE['12419'];
    txtFieldArrNt[1] = "tf1_wordGroup2,"+LANG_LOCALE['12419'];
    txtFieldArrNt[2] = "tf1_wordGroup3,"+LANG_LOCALE['12419'];

	if (txtFieldArrayCheck(txtFieldIdArr) == false)
		return false;

    if (isProblemCharArrayCheck(txtFieldArrNt, '\'" ', NOT_SUPPORTED) == false) 
        return false;

	if (ipv4Validate('tf1_ldapAuthServer1', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
		return false;

    var authServerObj = document.getElementById('tf1_ldapAuthServer2');
    
    if(authServerObj && authServerObj.value != "")
        {
        if (ipv4Validate ('tf1_ldapAuthServer2', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
    	return false;
        }
    
    authServerObj = document.getElementById('tf1_ldapAuthServer3');
    
    if(authServerObj && authServerObj.value != "")
        {
        if (ipv4Validate ('tf1_ldapAuthServer3', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
    	return false;
        }
    
    if (alphaNumericValueCheck ("tf1_wordGroup1", "!@#$%^&()-_'{}.~", LANG_LOCALE['30281']+":") == false)
		return false;
	
	var txtSecondWrkGrpObj = document.getElementById ('tf1_wordGroup2');
	
	if(txtSecondWrkGrpObj && (txtSecondWrkGrpObj.value != ""))
	    {
	    if (alphaNumericValueCheck ("tf1_wordGroup2", "!@#$%^&()-_'{}.~", LANG_LOCALE['30282']+":") == false)
		    return false;
		}
    
    var txtThirdWrkGrpObj = document.getElementById ('tf1_wordGroup3');
	if(txtThirdWrkGrpObj && (txtThirdWrkGrpObj.value != "")) {
	    if (alphaNumericValueCheck ("tf1_wordGroup3", "!@#$%^&()-_'{}.~", LANG_LOCALE['30283']+":") == false)
		    return false;
	}
    
    if ( !isDependent (['tf1_ldapAuthServer1', 'tf1_wordGroup1'], LANG_LOCALE['30284'] ) ) {
         return false;   
    }
    
    if ( !isDependent (['tf1_ldapAuthServer2', 'tf1_wordGroup2'], LANG_LOCALE['30285'] ) ) {
        return false;
    }
    
    if ( !isDependent (['tf1_ldapAuthServer3', 'tf1_wordGroup3'], LANG_LOCALE['30286'] ) ) {
        return false;
    }
    
    var timeObj = document.getElementById ('tf1_ldapTimeout');
    if (timeObj)
        {
            if (numericValueRangeCheck1 (timeObj, '', '', 1, true, LANG_LOCALE['30406']+':', '') == false)
                return false;
        }

    var retriObj = document.getElementById ('tf1_ldapRetries');
    if (retriObj)
        {
            if (numericValueRangeCheck1 (retriObj, '', '', 5, true, LANG_LOCALE['30407']+':', '') == false)
                return false;
        }

    var combinedValue = (document.getElementById('tf1_ldapTimeout').value) * (document.getElementById('tf1_ldapRetries').value);
    if (combinedValue > 30)
        {
            alert(LANG_LOCALE['30256']);
            return false;
        }

	return true;
}
