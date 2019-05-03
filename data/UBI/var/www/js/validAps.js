/*
* File: validAps.js
* Created on 29th Nov 2012 - Laxmi
* Copyright (c) 2012 TeamF1, Inc.
* All rights reserved.
*/
/**
 * This function calls Page loads
 * Onload validation
 * @method onloadCall
 */
function onloadCallValidApsFn() {
	onloadCall();
	changeAPMode('tf1_apMode1');
	enableAuthenticationPassword('off');
}

/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method validateValidApsForm
 */
function validateValidApsForm(frmId) {
	var txtFieldIdArr = new Array();
	txtFieldIdArr[0] = "tf1_macAddr,Please enter valid MAC Address.";
	txtFieldIdArr[1] = "tf1_authPassword,Please enter Authentication Password";
	txtFieldIdArr[2] = "tf1_profile,Please enter valid Profile";
	txtFieldIdArr[3] = "tf1_expectedSSID,Please enter valid Expected SSID";

	if (txtFieldArrayCheck(txtFieldIdArr) == false)
		return false;
		
	if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;

    if(fieldLengthCheck('tf1_authPassword',8,64,'Authentication Password Length Must be between 8 and 64')==false)
		return false;

	var macObj = document.getElementById('tf1_macAddr');
	if (macAddrValidate(macObj.value, true, "", '', macObj) == false) {
		macObj.focus();
		return false;
	}
	
	setHiddenChks(frmId);
	return true;
}

/**
 * This function calls when user selects AP Mode
 * OnClick event
 * @method changeAPMode
 * @params radioName - Radio Name
 */
function changeAPMode(radioName) {
	var selValue = radioCheckedValueGet(radioName);
	if (!selValue)
		return;
	switch (parseInt(selValue, 10)) {
		case 1:
			/* Standalone */
			fieldStateChangeWr('tf1_authPassword tf1_enableAuthPassword tf1_profile tf1_radio1Channel tf1_radio1Power tf1_radio2Channel tf1_radio2Power', '', 'tf1_expectedSSID tf1_expectedChannel tf1_expectedSecurityMode', 'tf1_expectedWidsMode_div tf1_expectedWiredNetworkMode_div');
			vidualDisplay('tf1_authPassword tf1_enableAuthPassword tf1_profile tf1_radio1Channel tf1_radio1Power tf1_radio2Channel tf1_radio2Power tf1_radio1 tf1_radio2', 'hide');
			vidualDisplay('break3 break4', 'hide');
			vidualDisplay('tf1_expectedSSID tf1_expectedChannel tf1_expectedSecurityMode tf1_expectedWidsMode tf1_expectedWiredNetworkMode', 'configRow')
			vidualDisplay('break5 break6 break7 break8 break9', 'break');
			break;

		case 0:
			/* Managed */
			fieldStateChangeWr('tf1_expectedSSID tf1_expectedChannel tf1_expectedSecurityMode', 'tf1_expectedWidsMode_div tf1_expectedWiredNetworkMode_div', 'tf1_location tf1_authPassword tf1_enableAuthPassword  tf1_profile tf1_radio1Channel tf1_radio1Power tf1_radio2Channel tf1_radio2Power tf1_radio1 tf1_radio2', '');
			vidualDisplay('break3 break4', 'break');
			vidualDisplay('tf1_expectedSSID tf1_expectedChannel tf1_expectedSecurityMode tf1_expectedWidsMode tf1_expectedWiredNetworkMode', 'hide');
			vidualDisplay('break5 break6 break7 break8 break9', 'hide');
			vidualDisplay('tf1_location tf1_authPassword tf1_enableAuthPassword tf1_profile tf1_radio1Channel tf1_radio1Power tf1_radio2Channel tf1_radio2Power tf1_radio1 tf1_radio2', 'configRow');

			var imgObjVal = document.getElementById('tf1_enableAuthPassword').className;
			var imageName = imgObjVal.substring(imgObjVal.lastIndexOf('/') + 1);
			if (imageName == ON_ANCHOR)
				enableAuthenticationPassword('on');
			else
				enableAuthenticationPassword('off');
			break;

		case 2:
			/* Rogue*/
			fieldStateChangeWr('tf1_authPassword tf1_enableAuthPassword tf1_profile tf1_expectedSSID tf1_expectedChannel tf1_expectedSecurityMode tf1_radio1Channel tf1_radio1Power tf1_radio2Channel tf1_radio2Power', 'tf1_expectedWidsMode_div tf1_expectedWiredNetworkMode_div', '', '');
			vidualDisplay('tf1_authPassword tf1_enableAuthPassword tf1_profile tf1_expectedSSID tf1_expectedChannel tf1_expectedSecurityMode tf1_radio1Channel tf1_radio1Power tf1_radio2Channel tf1_radio2Power tf1_expectedWidsMode tf1_expectedWiredNetworkMode tf1_radio2Power tf1_radio1 tf1_radio2', 'hide');
			vidualDisplay('break3 break4 break5 break6 break7 break8 break9', 'hide');
			break;
	}
}

/****
 * This function calls when user click on enable Authentication Password button
 * OnClick event
 * @method enableAuthenticationPassword
 * @param type - Image status
 */
function enableAuthenticationPassword(type) {
	var imgObjVal = document.getElementById('tf1_enableAuthPassword').className;
	var imageName = imgObjVal.substring(imgObjVal.lastIndexOf('/') + 1);
	if (type == 'off') {
		fieldStateChangeWr('tf1_authPassword', '', '', '');
		vidualDisplay('tf1_authPassword', 'hide');
	} else if (type == 'on') {
		fieldStateChangeWr('', '', 'tf1_authPassword', '');
		vidualDisplay('tf1_authPassword', 'configRow');
	} else {
		if (imageName == OFF_ANCHOR) {
			fieldStateChangeWr('', '', 'tf1_authPassword', '');
			vidualDisplay('tf1_authPassword', 'configRow');
		} else if (imageName == ON_ANCHOR) {
			fieldStateChangeWr('tf1_authPassword', '', '', '');
			vidualDisplay('tf1_authPassword', 'hide');
		}
	}
}

/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method validatePowerSettingsConfig
 */
function validatePowerSettingsConfig() {
	var txtFieldIdArr = new Array();
	txtFieldIdArr[0] = "tf1_power,Please enter valid Power.";
	

	if (txtFieldArrayCheck(txtFieldIdArr) == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_power'), '', '', 1, 100,true, 'Invalid Power', '%') == false)
	    return false; 
	return true;
}


