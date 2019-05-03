/*
 * File: ipv6AddressPools.js
 * Created on 22nd nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method ipv6AddressPoolsValidate
 */
function ipv6AddressPoolsValidate(){

    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_txtIpv6StAddr,"+LANG_LOCALE['12128'];
    txtFieldIdArr[1] = "tf1_txtIpv6EndAddr,"+LANG_LOCALE['12008'];
    txtFieldIdArr[2] = "tf1_txtIpv6PrefLen,"+LANG_LOCALE['12087'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
        
    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    if (ipv6Validate('tf1_txtIpv6StAddr', true, true, '') == false) 
        return false;
    
    if (ipv6Validate('tf1_txtIpv6EndAddr', true, true, '') == false) 
        return false;
    
    if (startEndCompare('tf1_txtIpv6StAddr', 'tf1_txtIpv6EndAddr') == false) {
        return false;
    }
    
    var preLenObj = document.getElementById('tf1_txtIpv6PrefLen');
    if (numericValueRangeCheck(preLenObj, '', '', 1, 128, true, LANG_LOCALE['11321']+': ', '') == false) 
        return false;
    
    return true;
}
