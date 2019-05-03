/*
 * File: sslVpnClientRoutesConfig.js
 * TeamF1 Inc, 2012
 * Created on 8th Nov 2012 - Bala Krishna G
 */
/****
 * Validating form fields
 * @method routeValidate
 */
function routeValidate(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_ipAddr,"+LANG_LOCALE['12252'];
    txtFieldIdArr[1] = "tf1_snetMask,"+LANG_LOCALE['12402'];

    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;    

    if (ipv4Validate('tf1_ipAddr', 'SN', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
    if (checkSubnetMask() == false) 
        return false;
    return true;
}

/****
 * Validating Subnet Mask
 * @method checkSubnetMask
 */
function checkSubnetMask(){
    var ipaddrObj = document.getElementById('tf1_snetMask');
    var octetArr = ipaddrObj.value.split(".");
    if (octetArr && !isNaN(octetArr[3]) && parseInt(octetArr[3], 10) == 0) {
        if (validNetMask('tf1_snetMask') == false) 
            return false;
    }
    else {
        if (ipv4Validate('tf1_snetMask', 'SM', false, true, "Invalid Subnet Mask.", "for octet ", true) == false) 
            return false;
    }
    return true;
}
