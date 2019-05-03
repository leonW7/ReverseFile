/*
 * File: knownClients.js
 * Created on 19th nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
 
/**
 * This function calls Page loads
 * Onload validation
 * @method onloadCall
 */ 
jQuery(function () {
	changeMacAuthListType('tf1_listTypeBlack');
});

/**
 * This function calls when user clicks on submit button.
 * OnSubmit validation
 * @method knownClientsValidate
 */
function knownClientsValidate(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_txtMacAddr, Please enter valid Mac Address";
    txtFieldIdArr[1] = "tf1_clientName, Please enter valid Name";
    txtFieldIdArr[2] = "tf1_description, Please enter valid Description";
    
    var txtFieldIdArrText = new Array();
    txtFieldIdArrText[0] = "tf1_txtMacAddr, Please enter valid Mac Address";
    txtFieldIdArrText[1] = "tf1_clientName, Please enter valid Name";
    
    if (isProblemCharArrayCheck(txtFieldIdArrText, "'\" ", NOT_SUPPORTED) == false) 
        return false;
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) {
        return false;
    }
    macObj = document.getElementById('tf1_txtMacAddr');
    if (!(macAddrValidate(macObj.value, true, "", '', macObj))) {
        macObj.focus();
        return false;
    }
    
    return true;
}

/**
 * function for changing the MAC Authentication List Type 
 * Onclick event
 * @method changeMacAuthListType
 * @param radioName - Radio button name
 */
function changeMacAuthListType(radioName){
    var selValue = radioCheckedValueGet(radioName);
    if (!selValue) 
        return;
    switch (parseInt(selValue, 10)) {
        case 1: /* Black-list */
            fieldStateChangeWr('tf1_whiteListTable', '', 'tf1_blackListTable', '');
            vidualDisplay('tf1_blackListTable', 'CLR');
            vidualDisplay('tf1_whiteListTable', 'hide');
            document.getElementById("tf1_MacAuthListType").innerHTML = "MAC Authentication Black-List";

            break;
            
        case 2: /* White-list */
        	//alert(1);
            fieldStateChangeWr('tf1_blackListTable', '', 'tf1_whiteListTable', '');
            vidualDisplay('tf1_blackListTable', 'hide');
            vidualDisplay('tf1_whiteListTable', 'CLR');
            document.getElementById("tf1_MacAuthListType").innerHTML = "MAC Authentication White-List";
            break;
    }
}
