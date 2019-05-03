/*
* File: isatapTunnelsConfig.js
* Created on 20th nov 2012 - Laxmi
* Copyright (c) 2012 TeamF1, Inc.
* All rights reserved.
*/

/**
 * This function calls when page loads
 * OnLoad validation
 */
 function onLoadIstatapTunnelsFn () {
	isatapTunnelsConfigOnload({
		imageId : '',
		disableIndividual : '',
		disableGrp : '',
		enableIndividual : '',
		enableGrp : '',
		hideClass : 'hide',
		showClass : 'configRow',
		breakDivs : '',
		breakClass : 'break',
		imagesInfo : {
			disableImages : '',
			enableImages : '',
			disableClass : '',
			enableClass : ''
		}
	})
}

/**
 * This function calls when page loads
 * @method isatapTunnelsConfigOnload
 * @param toggleObj - object
 */
function isatapTunnelsConfigOnload(toggleObj) {
	endPointAddressTypeChange('tf1_endPointAddressLAN');
}

/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method isatapTunnelsConfigValidate
 */
function isatapTunnelsConfigValidate() {
	var txtFieldIdArr = new Array();
	txtFieldIdArr[0] = "tf1_txtPrefixLen, "+LANG_LOCALE['12037'];
	txtFieldIdArr[1] = "tf1_txtIpAddress,"+LANG_LOCALE['12294'];

	if (txtFieldArrayCheck(txtFieldIdArr) == false)
		return false;
		
	if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;

	if (ipv6Validate('tf1_txtPrefixLen', false, true, '') == false)
		return false;

	if (ipv4Validate('tf1_txtIpAddress', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
		return false;

	return true;
}

/**
 * function for changing the mode settings of radio buttons
 * Onclick event
 * @method endPointAddressTypeChange
 * @param radioName - Radio button name
 */
function endPointAddressTypeChange(radioName) {
	var selValue = radioCheckedValueGet(radioName);
	if (!selValue)
		return;
	switch (parseInt(selValue, 10)) {
		case 1:
			/* LAN */
			fieldStateChangeWr('tf1_txtIpAddress', '', '', '');
			vidualDisplay('tf1_txtIpAddress', 'hide');
			break;

		case 2:
			/* Other IP */
			fieldStateChangeWr('', '', 'tf1_txtIpAddress', '');
			vidualDisplay('tf1_txtIpAddress', 'configRow');
			break;
	}
}
