/*
 * File: ipMacBindingConfig.js
 * Created on 19th nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */


/**
 * This function calls when user clicks on submit button.
 * OnSubmit validation
 * @method validateIpMacBingingConfig
 */
function validateIpMacBingingConfig(frmId){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_txtName, "+LANG_LOCALE['12064'];
    txtFieldIdArr[1] = "tf1_txtMacAddr, "+LANG_LOCALE['12049'];
    txtFieldIdArr[2] = "tf1_txtIpAddr, "+LANG_LOCALE['12028'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
    
    if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;
    
    macObj = document.getElementById('tf1_txtMacAddr');
    if (!macObj || macObj.disabled) 
        return true;
    if (!(macAddrValidate(macObj.value, true, "", '', macObj))) {
        macObj.focus();
        return false;
    }
    if (ipv4Validate('tf1_txtIpAddr', 'NSN', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
    
    setHiddenChks(frmId)
    return true;
}
