/*
 * File: routerAdvertisement.js
 * Created on 16th Sep 2016 - Ramakrishna Reddy P.M
 * Copyright (c) 2016 TeamF1, Inc.
 * All rights reserved.
 */

/**
 * function for toggle the image
 * @method onLoadCallRouterAdvertisement
 * @param toggleObj - object
 */
function onLoadCallRouterAdvertisement() {
	onloadCall();
    routerAdvtModeChange('tf1_routerAdvtMode1');
}

/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method routerAdvtValidate
 */
function routerAdvtValidate(frmId) {
	var txtFieldIdArr = new Array();
	txtFieldIdArr[0] = "tf1_routerAdvtInterval,"+LANG_LOCALE['11967'];
	txtFieldIdArr[1] = "tf1_routerAdvtMTU,"+LANG_LOCALE['12061'];
	txtFieldIdArr[2] = "tf1_routerAdvtLifetime,"+LANG_LOCALE['12106'];

	if (txtFieldArrayCheck(txtFieldIdArr) == false)
		return false;
		
	if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;

	var intervalObj = document.getElementById('tf1_routerAdvtInterval');
	if (numericValueRangeCheck(intervalObj, '', '', 10, 1800, true, LANG_LOCALE['11206']+': ',  LANG_LOCALE['12732']) == false)
		return false;

	var mtuObj = document.getElementById('tf1_routerAdvtMTU');
	if (numericValueRangeCheck(mtuObj, '', '', 1280, 1500, true, LANG_LOCALE['11309']+': ', '') == false)
		return false;

	if (checkLifetime() == false)
		return false;
		
	setHiddenChks(frmId);
	return true;
}

/**
 * function for validate Life time
 * @method checkLifetime
 */
function checkLifetime() {
	var lifetimeObj = document.getElementById('tf1_routerAdvtLifetime');
	var advIntObj = document.getElementById('tf1_routerAdvtInterval');
	if (numericValueRangeCheck(advIntObj, '', '', 10, 1800, true, LANG_LOCALE['11206'],  LANG_LOCALE['12732']) == false)
		return false;
		if (advIntObj.disabled)
			return numericValueRangeCheck(lifetimeObj, '', '', 30, 9000, true, LANG_LOCALE['11343']+': ', '');
		else
			return numericValueRangeCheck(lifetimeObj, '', '', parseInt(advIntObj.value, 10), 9000, true, LANG_LOCALE['11343']+': ', '');
	return true;
}

/**
 * function for changing the mode settings of radio buttons
 * Onclick event
 * @method routerAdvtModeChange
 * @param radioName - Radio button name
 */
function routerAdvtModeChange(radioName) {
	var radioObj = radioCheckedValueGet(radioName);	
	if (!radioObj)
		return;
	switch (parseInt(radioObj, 10)) {
		case 1:
			/* Unsolicited Multicast */
			fieldStateChangeWr('', '', 'tf1_routerAdvtInterval', '');
			vidualDisplay('tf1_routerAdvtInterval', 'configRow');
			vidualDisplay('break2', 'break');
			break;

		case 2:
			/* Unicast Only */
			fieldStateChangeWr('tf1_routerAdvtInterval', '', '', '');
			vidualDisplay('tf1_routerAdvtInterval', 'hide');
			vidualDisplay('break2', 'hide');
			break;
	}
}
