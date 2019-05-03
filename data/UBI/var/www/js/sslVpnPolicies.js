/*
 * File: sslVpnPolicies.js
 * Created on 23rd Nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 * This function calls at the time of page loads
 * OnLoad validation
 */
function sslVpnServerFn(){
    policyTypeCheck('tf1_portalLayout1');
    applyPolicyToType('tf1_applyPolicy');
}

/**
 * This function calls when user clicks on submit button
 * On submit validation
 * @method sslVpnPoliciesValidate
 */
function sslVpnPoliciesValidate(frmId){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_txtPolicyName, "+LANG_LOCALE['12080'];
    txtFieldIdArr[1] = "tf1_txtIPAddress,"+LANG_LOCALE['12028'];
    txtFieldIdArr[2] = "tf1_txtMaskLen,"+LANG_LOCALE['12050'];
    txtFieldIdArr[3] = "tf1_txtStrPort,"+LANG_LOCALE['11979'];
    txtFieldIdArr[4] = "tf1_txtEndPort,"+LANG_LOCALE['12009'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

    if (alphaNumericValueCheck ("tf1_txtPolicyName", '', '') == false)    
        return false;

    if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;
    
    if (ipv4Validate('tf1_txtIPAddress', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
    
    var maskObj = document.getElementById('tf1_txtMaskLen');
    if (maskObj && !maskObj.disabled) {
        if (numericValueRangeCheck(maskObj, '', '', 0, 32, true, '', '') == false) 
            return false;
    }
    
    var beginObj = document.getElementById('tf1_txtStrPort');
    if (beginObj && !beginObj.disabled) {
        if (numericValueRangeCheck(beginObj, '', '', 0, 65535, true, LANG_LOCALE['11226'], '') == false) 
            return false;
    }
    var endObj = document.getElementById('tf1_txtEndPort');
    if (endObj && !endObj.disabled) {
        if (numericValueRangeCheck(endObj, '', '', 0, 65535, true, LANG_LOCALE['11259'], '') == false) 
            return false;
    }
    if (checkMinMax() == false) 
        return false;
    var definedResObj = document.getElementById("tf1_definedResources");
	if (definedResObj && !definedResObj.disabled){
		if (definedResObj.selectedIndex == -1) {
			alert(LANG_LOCALE['12435']);
			return false;
		}
	}
    setHiddenChks(frmId);
    return true;
}

/**
 * function for check the value of port numbers
 * Onclick event
 * @method checkMinMax
 */
function checkMinMax(){
    var beginObj = document.getElementById('tf1_txtStrPort').value;
    var endObj = document.getElementById('tf1_txtEndPort').value;
    if (parseInt(beginObj,10) > parseInt(endObj,10)) {        
        alert(LANG_LOCALE['10378']);
        return false;
    }
    return true;
}

/**
 * function for changing the mode settings of radio buttons
 * Onclick event
 * @method policyTypeCheck
 * @param radioName - Radio button name
 */
function policyTypeCheck(radioName){
    var selValue = radioCheckedValueGet(radioName);
    if (!selValue) 
        return;
    switch (parseInt(selValue, 10)) {
        case 1: /* Global */
            fieldStateChangeWr('', 'tf1_availableGroups_div tf1_availableUsers_div', '', '');
            vidualDisplay('tf1_availableGroups tf1_availableUsers', 'hide');
            vidualDisplay('break1 break2', 'hide');
            break;
            
        case 2: /* Group */
            fieldStateChangeWr('', 'tf1_availableUsers_div', '', 'tf1_availableGroups_div');
            vidualDisplay('tf1_availableUsers', 'hide');
            vidualDisplay('break2', 'hide');
            vidualDisplay('tf1_availableGroups', 'configRow');
            vidualDisplay('break1', 'break');
            break;
        case 3: /* User */
            fieldStateChangeWr('', 'tf1_availableGroups_div', '', 'tf1_availableUsers_div');
            vidualDisplay('tf1_availableGroups', 'hide');
            vidualDisplay('break1', 'hide');
            vidualDisplay('tf1_availableUsers', 'configRow');
            vidualDisplay('break2', 'break');
            break;
    }
}

/**
 * function for changing the mode settings of Select Box
 * OnChange event
 * @method applyPolicyToType
 * @param selName - selectbox name
 */
function applyPolicyToType(selName){
    var selValue = comboSelectedValueGet(selName);
    if (!selValue) 
        return;
    switch (parseInt(selValue, 10)) {
        case 1: /* Network Resource */
            fieldStateChangeWr('tf1_txtIPAddress tf1_txtMaskLen tf1_txtStrPort tf1_txtEndPort', 'tf1_service_div', 'tf1_definedResources', '');
            vidualDisplay('tf1_txtIPAddress tf1_txtMaskLen tf1_txtStrPort tf1_txtEndPort tf1_service', 'hide');
            vidualDisplay('break6 break7 break8 break10', 'hide');
            vidualDisplay('tf1_definedResources', 'configRow');
	    	vidualDisplay('break11', 'break'); 
            break;
            
        case 2: /* IP Address */
            fieldStateChangeWr('tf1_txtMaskLen tf1_definedResources', '', 'tf1_txtIPAddress tf1_txtStrPort tf1_txtEndPort', 'tf1_service_div');
            vidualDisplay('tf1_txtMaskLen tf1_definedResources', 'hide');
            vidualDisplay('break6 break11', 'hide');
            vidualDisplay('tf1_txtIPAddress tf1_txtStrPort tf1_txtEndPort tf1_service', 'configRow');
            vidualDisplay('break6 break7 break8 break10', 'break');
            break;
            
        case 3: /* IP Network */
            fieldStateChangeWr('tf1_definedResources', '', 'tf1_txtIPAddress tf1_txtMaskLen tf1_txtStrPort tf1_txtEndPort', 'tf1_service_div');
            vidualDisplay('tf1_definedResources', 'hide');
	    	vidualDisplay('break11', 'hide');        
            vidualDisplay('tf1_txtIPAddress tf1_txtMaskLen tf1_txtStrPort tf1_txtEndPort tf1_service', 'configRow');
            vidualDisplay('break6 break7 break8 break10', 'break');
            break;
            
        case 4: /* All Addresses */
            fieldStateChangeWr('tf1_txtIPAddress tf1_txtMaskLen tf1_definedResources', '', 'tf1_txtStrPort tf1_txtEndPort', 'tf1_service_div');
            vidualDisplay('tf1_txtIPAddress tf1_txtMaskLen tf1_definedResources', 'hide');
            vidualDisplay('break6 break11 break12', 'hide');
            vidualDisplay('tf1_txtStrPort tf1_txtEndPort tf1_service', 'configRow');
            vidualDisplay('break7 break8 break10', 'break');
            break;
    }
}
