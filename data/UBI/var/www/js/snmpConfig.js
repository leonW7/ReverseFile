/*
 * File: snmpConfig.js
 * TeamF1 Inc, 2012
 * Created on 8th Nov 2012 - Bala Krishna G
 */
/****
 * validate the form
 * @method pageValidate
 */
function pageValidate(){
    var txtFieldIdArr = new Array();
    var alertMessage = LANG_LOCALE['13505'];
    var alertMessage1 = LANG_LOCALE['13506'];
    var alertMessage2 = LANG_LOCALE['12181'];
    var alertMessage3 = LANG_LOCALE['11281'];
    var alertMessage4 = LANG_LOCALE['12336'];
    txtFieldIdArr[0] = "tf1_ipAddress," + alertMessage;
    txtFieldIdArr[1] = "tf1_port," + alertMessage4;
    txtFieldIdArr[2] = "tf1_community," + alertMessage2;
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    var txtIpAddressObj = document.getElementById("tf1_ipAddress");
    if (ipv4AddrValidate(txtIpAddressObj, 'SN', false, true, alertMessage3, LANG_LOCALE['11031'], true) == false)
        return false;
    
    /* Check time out	 */
    var myObj = document.getElementById('tf1_port');
    if (numericValueRangeCheck(myObj, '', '', 1, 65535, true, LANG_LOCALE['11315']+': ', '') == false) 
        return false;
    
    
    return true;
}

/****
 * validate the form
 * @method pageValidate2
 */
function pageValidate2(){
    var txtFieldIdArr = new Array();
    var alertMessage = LANG_LOCALE['12028'];
    var alertMessage1 = LANG_LOCALE['12133'];
    var alertMessage2 = LANG_LOCALE['12181'];
    var alertMessage3 = LANG_LOCALE['11281'];
    
    txtFieldIdArr[0] = "tf1_ipAddress2," + alertMessage;
    txtFieldIdArr[1] = "tf1_subnet," + alertMessage1;
    txtFieldIdArr[2] = "tf1_community2," + alertMessage2;
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
        
    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    var txtIpAddressObj = document.getElementById("tf1_ipAddress2");
    if (txtIpAddressObj.value != '0.0.0.0') {
        if (ipv4AddrValidate(txtIpAddressObj, 'SN', false, true, alertMessage3, LANG_LOCALE['11031'], true) == false) 
            return false;
    }
    
    /* Check time out	 */
    var myObj = document.getElementById('tf1_port2');
    if (numericValueRangeCheck(myObj, '', '', 0, 65535, true, '', '') == false) 
        return false;
    
    if (checkSubnetMask('tf1_ipAddress2', 'tf1_subnet') == false) 
        return false;
    
    return true;
}

/****
 * validate the Subnet Mask
 * @method checkSubnetMask
 */
function checkSubnetMask(ipAddrId, subnetId){
    var ipaddrObj = document.getElementById(ipAddrId);
    var subnetmaskObj = document.getElementById(subnetId);
    if ((ipaddrObj.value == '0.0.0.0') && (subnetmaskObj.value == '0.0.0.0')) {
        return true;
    }

    if ((ipaddrObj.value == '0.0.0.0') && (subnetmaskObj.value != '0.0.0.0')) {
        if (ipv4AddrValidate(ipaddrObj, 'SN', false, true, "Invalid IP address.", 'for octet ', true) == false) 
            return false;
    }

    if(validSubNetMask (subnetId) ==  false) {
        return false;
    }
    
    if(setNetworkIpAddress (ipAddrId, subnetId) == false) {
        return false;
    }

    return true;
}

function validSubNetMask(objId){
    var msg = "Please enter valid CIDR Subnet Mask.";
    var obj = document.getElementById(objId); // get the subnet mask object
    if (!obj || obj.disabled) 
        return true;
    if (obj) {
        if (ipSnetMaskFormatCheck(objId) == false) {
            obj.focus();
            return false;
        }
        else {
            netmask = getIPInt1(objId) // get decimal value of ip address
            neg = ((~ netmask) & 0xFFFFFFFF);
            if (!(((neg + 1) & neg) === 0)) {
                alert(msg);
                obj.focus();
                return false;
            }
            else 
                return true;
        }
    }
    return true;
}


