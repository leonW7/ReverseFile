/*
 * File: discoveredVlans.js
 * Created on 26th Nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/****
 * This function calls when user clicks on submit button
 * On submit validation
 * @method pageValidate
 */
function pageValidate(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_VLAN, Please enter a valid VLAN.";
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
        
    if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;    
        
    var vlanObj = document.getElementById('tf1_VLAN');
    if (vlanObj && !vlanObj.disabled) {
        if (numericValueRangeCheck(vlanObj, 1, "Invalid VLAN. Enter valid VLAN between 1 and 4093", 1, 4093, true, "Invalid VLAN.", "") == false) 
            return false;
    }
    return true;
}

