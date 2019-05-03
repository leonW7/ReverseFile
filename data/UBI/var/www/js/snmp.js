/*
 * File: snmp.js
 * Created on 19th December 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
function onloadCallSnmpFn (){    
	checkSecurityLevel('tf1_securityLevel');   
}

/**
 * This function calls when user clicks on submit button.
 * OnSubmit validation
 * @method pageValidate
 */
function pageValidate() {
	var txtFieldIdArr = new Array();	
	txtFieldIdArr[0] = "tf1_txtAuthPass,"+LANG_LOCALE['12221'];
    txtFieldIdArr[1] = "tf1_txtPrivPass,"+LANG_LOCALE['12343'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false)
	    return false;   
	
	if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;

    return true;
}
/**
 * function for changing the mode settings of radio buttons
 * Onclick event
 * @method checkSecurityLevel
 * @param selName - Select Box Id
 */
function checkSecurityLevel(selName){
    var selValue = comboSelectedValueGet(selName);
    if (!selValue) 
        return;
    switch (parseInt(selValue, 10)) {
        case 1: /* All IP Addresses */
            fieldStateChangeWr('tf1_authAlogorithm tf1_txtAuthPass tf1_privacyAlogorithm tf1_txtPrivPass', '', '', '');
            vidualDisplay('tf1_authAlogorithm tf1_txtAuthPass tf1_privacyAlogorithm tf1_txtPrivPass', 'hide');
            vidualDisplay('break3 break4 break5 beak6', 'hide');
        break;
            
        case 2: /* IP Address Range */
            fieldStateChangeWr('tf1_privacyAlogorithm tf1_txtPrivPass', '', 'tf1_authAlogorithm tf1_txtAuthPass', '');
            vidualDisplay('tf1_privacyAlogorithm tf1_txtPrivPass', 'hide');
            vidualDisplay('break5 beak6', 'hide');
            vidualDisplay('tf1_authAlogorithm tf1_txtAuthPass', 'configRow');
            vidualDisplay('break3 break4', 'break');
        break;  
        case 3: /* IP Address Range */
            fieldStateChangeWr('', '', 'tf1_authAlogorithm tf1_txtAuthPass tf1_privacyAlogorithm tf1_txtPrivPass', '');       
            vidualDisplay('tf1_authAlogorithm tf1_txtAuthPass tf1_privacyAlogorithm tf1_txtPrivPass', 'configRow');
            vidualDisplay('break3 break4 break5 beak6', 'break');
        break; 
            
    }
}
