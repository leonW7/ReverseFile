/*
 * File: doubleVLAN.js
 * Created on 26th Nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */

/**
 * This function calls Page loads
 * Onload validation
 * @method onloadCall
 */ 
function onLoadDoubleVlanFn() {
 	onloadCall ();		
	changeEtherType('tf1_etherTypeDot1q');
}

/****
 * This function calls when user clicks on submit button
 * On submit validation
 * @method dVlanConfigValidate 
 */

function dVlanConfigValidate (){
    var txtFieldIdArr = new Array ();    
    txtFieldIdArr[0] = "tf1_txtCustomTag, Please enter valid Custom Tag";
        
    if (txtFieldArrayCheck (txtFieldIdArr) == false)    	
        return false;
        
    if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;    
        
    if(isNumericValue ('tf1_txtCustomTag') == false)
        return false;
    return true; 
}

/**
 * This function calls when User select an radio option
 * @method changeEtherType
 * @param radioName - radio Button Name
 */
function changeEtherType(radioName){
    var selValue = radioCheckedValueGet(radioName);
    if (!selValue) 
        return;
    switch (parseInt(selValue, 10)) {
        case 1: /* Dot1q */
        case 2: /* vMAN */
            fieldStateChangeWr('tf1_txtCustomTag', '', '', '');
            vidualDisplay ('tf1_txtCustomTag', 'hide');  
            break;
        case 3: /* Custom */
            fieldStateChangeWr('', '', 'tf1_txtCustomTag', '');
            vidualDisplay ('tf1_txtCustomTag', 'configRow');            
            break;
    }
}

