/*
 * File: macBasedVlanConfig.js
 * Created on 19th nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 * This function calls when user clicks on submit button.
 * OnSubmit validation
 * @method macBasedVlanConfigValidate
 */
function macBasedVlanConfigValidate(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_txtMacAddr, Please enter valid Mac Address";
    txtFieldIdArr[1] = "tf1_txtMacVlanId, Please enter valid VLAN";
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) {
        return false;
    }
    
   	if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;

    macObj = document.getElementById('tf1_txtMacAddr');
    if (!(macAddrValidate(macObj.value, true, "", '', macObj))) {
        macObj.focus();
        return false;
    }
    var vlanIdObj = document.getElementById('tf1_txtMacVlanId');
    if (numericValueRangeCheck(vlanIdObj, 1, "", 1, 4096, true, "Invalid Vlan Id.", "") == false) {
        return false;
    }
    
    return true;
}
