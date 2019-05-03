/*
 * File: wdsManagedAPConfig.js
 * TeamF1 Inc, 2012
 * Created on 12th Feb 2013 - Lakshmi
 */
 
/****
 * validate the form
 * @method wdsManagedApConfigValidate
 */
function wdsManagedApConfigValidate(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_wdsApMacAddress,Please enter a valid WDS AP MAC Address";
    txtFieldIdArr[1] = "tf1_stpPriority,Please enter a valid STP Priority";    
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
        
    if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;

    macObj = document.getElementById('tf1_wdsApMacAddress');
    if (!(macAddrValidate(macObj.value, true, "", '', macObj))) {
        macObj.focus();
        return false;
    }
    
    if (alphaNumericValueCheck("tf1_stpPriority", '', "Invalid STP Priority. ") == false) 
        return false;   
    return true
}
/****
 * validate the form
 * @method wdsManagedApConfigValidateEdit
 */
function wdsManagedApConfigValidateEdit(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_stpPriorityEdit,Please enter a valid STP Priority";    
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
    
    if (alphaNumericValueCheck("tf1_stpPriorityEdit", '', "Invalid STP Priority. ") == false) 
        return false;   
    return true
}
