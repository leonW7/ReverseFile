/*
* File: apProvisioning.js
* Created on 12th Feb 2013 - Lakshmi
* Copyright (c) 2012 TeamF1, Inc.
* All rights reserved.
*/
/**
 * This function calls Page loads
 * Onload validation
 * @method onloadCall
 */

/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method pageValidate
 */
function pageValidate() {
	var txtFieldIdArr = new Array();
	txtFieldIdArr[0] = "tf1_txtMacAddr, Please enter valid MAC Address.";
	txtFieldIdArr[1] = "tf1_newPrimaryIpAddr, Please enter valid New Primary IP Address";
	txtFieldIdArr[2] = "tf1_newBackupIpAddr, Please enter valid New backup IP Address";
	txtFieldIdArr[3] = "tf1_txtProfile, Please enter valid Profile ";

	if (txtFieldArrayCheck(txtFieldIdArr) == false)
		return false;	
		
	if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;
	
	var newIpAddressObj = document.getElementById("tf1_newPrimaryIpAddr");
	var backupIpAddressObj = document.getElementById("tf1_newBackupIpAddr");

	if (newIpAddressObj.value == "0.0.0.0" ) {
		alert("Invalid address");
		newIpAddressObj.focus();
		return false;
	 }
	if (backupIpAddressObj.value == "0.0.0.0" ) {
		alert("Invalid address");
		backupIpAddressObj.focus();
		return false;
	 }
     
	if (ipv4Validate('tf1_newPrimaryIpAddr', 'IP', false, true, "Invalid IP Address", "For Octet", true) == false) 
    	    return false;
     
 
	if (ipv4Validate('tf1_newBackupIpAddr', 'IP', false, true, "Invalid IP Address", "For Octet", true) == false) 
	        return false;
	 
	return true;
}
