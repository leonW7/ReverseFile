/*
 * File: bridgeFirewallRules.js
 * Created on 19th May 2014 - Ramakrishna Reddy P.M
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
 
function onloadBridgeFirewallRulesFn () {
        onloadCall (enableDisableFieldsByImageClick, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});
	dropFieldSelectSrc ('tf1_addFwSrcUser1');
	dropFieldSelectDest ('tf1_addFwDestUser1');
	dropFieldSelMacSrc('tf1_addFwSrcMac1');
	dropFieldSelMacDest('tf1_addFwDestMac1');
}

function enableDisableFieldsByImageClick(data, thisObj) { 
    onAnchorToggle (data);
}

/****
 * This function calls when user selects an option from select box
 * OnChange event
 * @method dropFieldSelectSrc
 * @param radioName - Radio box Name
 */
function dropFieldSelectSrc (radioName) {
	var selValue = radioCheckedValueGet(radioName);
	if (!selValue)
		return;
	switch (parseInt(selValue, 10)) {
		case 0:
			/* Any */
			fieldStateChangeWr('tf1_txtFwSrcUserStart tf1_txtFwSrcUserFinish', '', '', '');
			vidualDisplay('tf1_txtFwSrcUserStart tf1_txtFwSrcUserFinish', 'hide');
			vidualDisplay('break5 break6', 'hide');
			break;
		case 1:
			/* Single */
			fieldStateChangeWr('tf1_txtFwSrcUserFinish', '', 'tf1_txtFwSrcUserStart', '');
			vidualDisplay('tf1_txtFwSrcUserFinish break6', 'hide');
			vidualDisplay('tf1_txtFwSrcUserStart', 'configRow');
			vidualDisplay('break5', 'break');
			break;
		case 2:
			/* Address Range */
			fieldStateChangeWr('', '', 'tf1_txtFwSrcUserStart tf1_txtFwSrcUserFinish', '');
			vidualDisplay('tf1_txtFwSrcUserStart tf1_txtFwSrcUserFinish', 'configRow');
			vidualDisplay('break5 break6', 'break');
			break;
	}
}

/****
 * This function calls when user selects an option from radio Button
 * Onclick event
 * @method dropFieldSelectDest
 * @param radioName - Radio box Name
 */
function dropFieldSelectDest (radioName) {
	var selValue = radioCheckedValueGet(radioName);
	if (!selValue)
		return;
	switch (parseInt(selValue, 10)) {
		case 0:
			/* Any */
			fieldStateChangeWr('tf1_txtFwDestUserStart tf1_txtFwDestUserFinish', '', '', '');
			vidualDisplay('tf1_txtFwDestUserStart tf1_txtFwDestUserFinish', 'hide');
			vidualDisplay('break8 break9', 'hide');
			break;
		case 1:
			/* Single */
			fieldStateChangeWr('tf1_txtFwDestUserFinish', '', 'tf1_txtFwDestUserStart', '');
			vidualDisplay('tf1_txtFwDestUserStart break8', 'configRow');
			vidualDisplay('break8', 'break');
			vidualDisplay('tf1_txtFwDestUserFinish break9', 'hide');
			break;
		case 2:
			/* Address Range */
			fieldStateChangeWr('', '', 'tf1_txtFwDestUserStart tf1_txtFwDestUserFinish', '');
			vidualDisplay('tf1_txtFwDestUserStart tf1_txtFwDestUserFinish', 'configRow');
			vidualDisplay('break8 break9', 'break');
			break;
	}
}

/****
 * This function calls when user selects an option from radio Button
 * Onclick event
 * @method dropFieldSelMacSrc
 * @param radioName - Radio box Name
 */
function dropFieldSelMacSrc (radioName)
    {
	var selValue = radioCheckedValueGet(radioName);
	if (!selValue)
		return;
	switch (parseInt(selValue, 10)) {
		case 0:
			/* Any */
			fieldStateChangeWr('tf1_txtFwSrcMacStart tf1_txtFwSrcMacFinish', '', '', '');
			vidualDisplay('tf1_txtFwSrcMacStart tf1_txtFwSrcMacFinish', 'hide');
			vidualDisplay('break11 break12', 'hide');
			break;
		case 1:
			/* Single */
			fieldStateChangeWr('tf1_txtFwSrcMacFinish', '', 'tf1_txtFwSrcMacStart', '');
			vidualDisplay('tf1_txtFwSrcMacFinish break12', 'hide');
			vidualDisplay('tf1_txtFwSrcMacStart', 'configRow');
			vidualDisplay('break11', 'break');
			break;
		case 2:
			/* Mac Address */
			fieldStateChangeWr('', '', 'tf1_txtFwSrcMacStart tf1_txtFwSrcMacFinish', '');
			vidualDisplay('tf1_txtFwSrcMacStart tf1_txtFwSrcMacFinish', 'configRow');
			vidualDisplay('break11 break12', 'break');
			break;
	}
}

/****
 * This function calls when user selects an option from radio Button
 * Onclick event
 * @method dropFieldSelMacDest
 * @param radioName - Radio box Name
 */

function dropFieldSelMacDest (radioName) {
	var selValue = radioCheckedValueGet(radioName);
	if (!selValue)
		return;
	switch (parseInt(selValue, 10)) {
		case 0:
			/* Any */
			fieldStateChangeWr('tf1_txtFwDestMacStart tf1_txtFwDestMacFinish', '', '', '');
			vidualDisplay('tf1_txtFwDestMacStart tf1_txtFwDestMacFinish', 'hide');
			vidualDisplay('break14 break15', 'hide');
			break;
		case 1:
			/* Single */
			fieldStateChangeWr('tf1_txtFwDestMacFinish', '', 'tf1_txtFwDestMacStart', '');
			vidualDisplay('tf1_txtFwDestMacFinish break15', 'hide');
			vidualDisplay('tf1_txtFwDestMacStart', 'configRow');
			vidualDisplay('break14', 'break');
			break;
		case 2:
			/* Mac Address */
			fieldStateChangeWr('', '', 'tf1_txtFwDestMacStart tf1_txtFwDestMacFinish', '');
			vidualDisplay('tf1_txtFwDestMacStart tf1_txtFwDestMacFinish', 'configRow');
			vidualDisplay('break14 break15', 'break');
			break;
	}
}

function bridgeFirewallRulesValidate (frmId)
    {
        var txtFieldIdArr = new Array ();    
        txtFieldIdArr[0] = "tf1_txtFwSrcUserStart, "+LANG_LOCALE['30301'];
        txtFieldIdArr[1] = "tf1_txtFwSrcUserFinish, "+LANG_LOCALE['30302'];
        txtFieldIdArr[2] = "tf1_txtFwDestUserStart, "+LANG_LOCALE['30303'];
        txtFieldIdArr[3] = "tf1_txtFwDestUserFinish, "+LANG_LOCALE['30304'];
	txtFieldIdArr[4] = "tf1_txtFwSrcMacStart, "+LANG_LOCALE['30305'];
	txtFieldIdArr[5] = "tf1_txtFwSrcMacFinish, "+LANG_LOCALE['30306'];	
	txtFieldIdArr[6] = "tf1_txtFwDestMacStart, "+LANG_LOCALE['30307'];
	txtFieldIdArr[7] = "tf1_txtFwDestMacFinish, "+LANG_LOCALE['30308'];	

        if (txtFieldArrayCheck (txtFieldIdArr) == false)
            return false;

        if (ipv4Validate ('tf1_txtFwSrcUserStart', 'IP', false, true,
             LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
    	return false;

	if (ipv4Validate ('tf1_txtFwSrcUserFinish', 'IP', false, true,
             LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
    	return false;

	if (ipv4Validate ('tf1_txtFwDestUserStart', 'IP', false, true,
             LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
    	return false;

	if (ipv4Validate ('tf1_txtFwDestUserFinish', 'IP', false, true,
             LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
    	return false;

        var invalidMacAddr = LANG_LOCALE['11295'] + " : "

        macSrcStartObj = document.getElementById('tf1_txtFwSrcMacStart');
        if (!macSrcStartObj || macSrcStartObj.disabled) return true;
        if (!(macAddrValidate (macSrcStartObj.value, true, invalidMacAddr, '', macSrcStartObj)))
            {
                macSrcStartObj.focus ();
                return false;
            }

        macSrcEndtObj = document.getElementById('tf1_txtFwSrcMacFinish');
        if (!macSrcEndtObj || macSrcEndtObj.disabled) return true;
        if (!(macAddrValidate (macSrcEndtObj.value, true, invalidMacAddr, '', macSrcEndtObj)))
            {
                macSrcEndtObj.focus ();
                return false;
            }

        macDestStartObj = document.getElementById('tf1_txtFwDestMacStart');
        if (!macDestStartObj || macDestStartObj.disabled) return true;
        if (!(macAddrValidate (macDestStartObj.value, true, invalidMacAddr, '', macDestStartObj)))
            {
                macDestStartObj.focus ();
                return false;
            }

        macDestEndObj = document.getElementById('tf1_txtFwDestMacFinish');
        if (!macDestEndObj || macDestEndObj.disabled) return true;
        if (!(macAddrValidate (macDestEndObj.value, true, invalidMacAddr, '', macDestEndObj)))
            {
                macDestEndObj.focus ();
                return false;
            }
	setHiddenChks(frmId);
    return true;
    }

