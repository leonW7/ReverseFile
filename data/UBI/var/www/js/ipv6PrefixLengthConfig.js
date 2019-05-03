/*
 * File: ipv6PrefixLengthConfig.js
 * TeamF1 Inc, 2012
 * Created on 9th Nov 2012 - Bala Krishna G
 */
/****
 * validate the form
 * @method prefixValidate
 */
function prefixValidate(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_prefix,"+LANG_LOCALE['12035'];
    txtFieldIdArr[1] = "tf1_ipv6PreLen,"+LANG_LOCALE['12036'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
        
    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    if (ipv6Validate('tf1_prefix', false, true, '') == false) 
        return false;
    
    var preLenObj = document.getElementById('tf1_ipv6PreLen');
    if (numericValueRangeCheck(preLenObj, '', '', 1, 128, true, LANG_LOCALE['11286']+': ', '') == false) 
        return false;
    
}
