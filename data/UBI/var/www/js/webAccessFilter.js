/*
 * File: webAccessFilter.js
 * Created on 24th April 2014 - Ramakrishna Reddy
 * Copyright (c) 2014 TeamF1, Inc.
 * All rights reserved.
 */
 
function onLoadWebAccFilterFn () {
	onloadCall (enableDisableFieldsByImageClick, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});
    changePolicyType ('tf1_accessType');
    }

function enableDisableFieldsByImageClick(data, thisObj) { 
    onAnchorToggle (data);
}

/**
 * This function calls when user clicks on submit button
 * On submit validation
 * @method webAccessFilterValidation
 */
function webAccessFilterValidation () {
    var txtValidArray = new Array();
    txtValidArray[0] = "tf1_webAccName,"+LANG_LOCALE['12064'];
    txtValidArray[1] = "tf1_singleIpAddr,"+LANG_LOCALE['30345'];
    
    if (txtFieldArrayCheck(txtValidArray) == false) 
        return false;

   if (alphaNumericValueCheck ("tf1_webAccName", '', '') == false)    
        return false;

   if (ipv4Validate('tf1_singleIpAddr', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;

	setHiddenChks('tf1_frmWebAccFilterConfig');
    return true;
    }

function changePolicyType (selName) {
    var selValue = comboSelectedValueGet (selName);
	if(!selValue)
		return false;
    switch (parseInt(selValue, 10)){
        case 0:
            fieldStateChangeWr('tf1_lanInterface', '', 'tf1_singleIpAddr', '');
            vidualDisplay ('tf1_singleIpAddr', 'configRow');
            vidualDisplay ('break_singleIpAddr', 'break');
            vidualDisplay ('tf1_lanInterface break_lanInterface', 'hide');
            break;
        case 1:
            fieldStateChangeWr('tf1_singleIpAddr', '', 'tf1_lanInterface', '');
            vidualDisplay ('tf1_lanInterface', 'configRow');
            vidualDisplay ('break_lanInterface', 'break');
            vidualDisplay ('tf1_singleIpAddr break_singleIpAddr', 'hide');
            break;
    }
}
