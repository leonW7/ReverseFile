/*
 * File: flowControlConfig.js
 * TeamF1 Inc, 2012
 * Created on 9th Nov 2012 - Bala Krishna G
 */
/****
 * validate the form
 * @method prefixValidate
 */
function pageValidations(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_profileName,Please enter a valid Profile Name.";
    txtFieldIdArr[1] = "tf1_sourceIP,Please enter a valid Source IP Address.";
    txtFieldIdArr[2] = "tf1_destIP,Please enter a valid Destination IP Address.";
    txtFieldIdArr[3] = "tf1_bandwidthMBPS,Please enter a valid Bandwidth Rate.";
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

    if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;      
    
    if (ipv4Validate('tf1_sourceIP', 'IP', false, true, "Invalid IP Address.", "for octet ", true) == false) 
        return false;
    
    if (ipv4Validate('tf1_destIP', 'IP', false, true, "Invalid IP Address.", "for octet ", true) == false) 
        return false;
    
    /* get and validate start port */
    var obj = null;
    obj = document.getElementById('tf1_bandwidthMBPS');
    if (!obj.disabled) {
        if (numericValueRangeCheck(obj, '', '', 1, 1000, true, '', '') == false) 
            return false;
    }
    
    return true;
}
