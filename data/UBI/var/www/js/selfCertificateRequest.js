/*
 * File: selfCertificateRequest.js
 * Created on 30th April 2013 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
 
/****
 * This function calls when user clicks on submit button
 * On submit validation
 * @method selfCertInfoValidate 
 */

function selfCertInfoValidate ()   {

    var txtFieldIdArr = new Array ();
    txtFieldIdArr[0] = "tf1_requestName,"+LANG_LOCALE['12064'];
    txtFieldIdArr[1] = "tf1_subjectName,"+LANG_LOCALE['12132'];

    if (txtFieldArrayCheck (txtFieldIdArr) == false)
         return false;

    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;

	if (ipv4Validate ('tf1_IPAddr', 'IP', true, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
    	return false;
    
	var domainObj = document.getElementById("tf1_domainName");
	if(domainObj.value != ""){
		if (alphaNumericValueCheck("tf1_domainName", '', LANG_LOCALE['11251']) == false) 
	        return false;
	}
	var emailObj = document.getElementById("tf1_emailAddress");
	if(emailObj.value != ""){
		if (validEmailChk(emailObj) == false) 
	        return false;
	}
    	
    return true;
} 

/* email validation */

function validEmailChk(emailId){
	var e=emailId.value;
	var e1=/^(?:\w+\.?)*\w+@(?:\w+\.)+\w+$/;
	if(!e.match(e1)){
		alert(LANG_LOCALE['11256']);
		emailId.focus();
		return false;
	}else{		
		return true;
	}
}
