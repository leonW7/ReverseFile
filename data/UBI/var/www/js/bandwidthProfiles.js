/*
 * File: bandwidthProfiles.js
 * Created on 12th Mar 2013 - Lakshmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
 
function onLoadBandwidthProFn () {
        
                onloadCall (enableDisableFieldsByImageClick, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});
		ChangePolicyType('tf1_policyType');
    ChangeProfileType('tf1_profileType');

            }

function enableDisableFieldsByImageClick(data, thisObj) { 
    onAnchorToggle (data);
}

/**
 * This function calls when user clicks on submit button
 * On submit validation
 * @method bandwidthProfilesValidation
 */
function bandwidthProfilesValidation(){
    var txtValidArray = new Array();
    txtValidArray[0] = "tf1_QosName, "+LANG_LOCALE['12064'];
    txtValidArray[1] = "tf1_minBandwidth, "+LANG_LOCALE['12059'];
    txtValidArray[2] = "tf1_maxBandwidth, "+LANG_LOCALE['12052'];
    
    if (txtFieldArrayCheck(txtValidArray) == false) 
        return false;

    if (alphaNumericValueCheck ("tf1_QosName", '', '') == false)    
        return false;

    var usrLimitObjMax = document.getElementById ('tf1_maxBandwidth');
	if (numericValueRangeCheck (usrLimitObjMax, '', '', 100, 1000000, true, LANG_LOCALE['11299']+'.', LANG_LOCALE['11488']) == false)
		return false;

	var usrLimitObjMin = document.getElementById ('tf1_minBandwidth');
	if (numericValueRangeCheck (usrLimitObjMin, '', '',1, parseInt(usrLimitObjMax.value, 10), true, LANG_LOCALE['11307']+'.', LANG_LOCALE['11488']) == false)
		return false;

	setHiddenChks('tf1_frmBandwidthProfiles2');
    return true;
}

/**
 * function for changing the mode settings of radio buttons
 * Onclick event
 * @method ChangePolicyType
 * @param radioName - Radio button name
 */
function ChangePolicyType(radioName){
    var selValue = comboSelectedValueGet(radioName);
    if (!selValue) 
        return;
    switch (parseInt(selValue, 10)) {
        case 0: /* Outbound */
            fieldStateChangeWr('tf1_lanInterface', '', 'tf1_wanInterface', '');
            vidualDisplay('tf1_lanInterface break_lanInterface break_policyType', 'hide');
            vidualDisplay('tf1_wanInterface', 'configRow');
            vidualDisplay('break_lanInterface', 'break');
            break;
            
        case 1: /* Inbound */
            fieldStateChangeWr('tf1_wanInterface', '', 'tf1_lanInterface', '');
            vidualDisplay('tf1_wanInterface break_lanInterface break_policyType', 'hide');
            vidualDisplay('tf1_lanInterface', 'configRow');
            vidualDisplay('break_policyType', 'break');
            break;       
            
    }
}

/**
 * function for changing the mode settings of radio buttons
 * Onclick event
 * @method ChangeProfileType
 * @param radioName - Radio button name
 */
function ChangeProfileType(radioName){
    var selValue = comboSelectedValueGet(radioName);
    if (!selValue) 
        return;
    switch (parseInt(selValue, 10)) {
        case 0: /* Priority */
            fieldStateChangeWr('tf1_minBandwidth tf1_maxBandwidth', '', 'tf1_priority', '');
            vidualDisplay('tf1_minBandwidth tf1_maxBandwidth', 'hide');
            vidualDisplay('break_minBandwidth break_maxBandwidth', 'hide');
            vidualDisplay('tf1_priority', 'configRow');
            vidualDisplay('break_priority', 'break');
            break;
        case 1: /* Rate */
            fieldStateChangeWr('tf1_priority', '', 'tf1_minBandwidth tf1_maxBandwidth', '');
            vidualDisplay('tf1_priority', 'hide');
            vidualDisplay('break_priority', 'hide');
            vidualDisplay('tf1_minBandwidth tf1_maxBandwidth', 'configRow');
            vidualDisplay('break_minBandwidth break_maxBandwidth', 'break');
            break;                                
    }
}




