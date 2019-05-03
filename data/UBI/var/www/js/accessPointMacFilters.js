/*
 * File: accessPointMacFilters.js
 * TeamF1 Inc, 2014
 * Created on 9th Nov 2012 - Bala Krishna G
 */
/****
 * validate the form
 * @method pageValidate
 */
 
function pageValidate(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_macAddr, "+LANG_LOCALE['12049'];
   
 if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
        
    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    if (ipv4Validate('tf1_ipAddr', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
    
    var macObj = document.getElementById('tf1_macAddr');
    if (macAddrValidate(macObj.value, true, "", '', macObj) == false) 
        return false;
    
    return true;
}
