/**
 * Onload Submit Function
 * @method pageValidate *
 */
function pageValidate(frmId){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_cntStAddr,"+LANG_LOCALE['12179'];
    txtFieldIdArr[1] = "tf1_cntEndAddr,"+LANG_LOCALE['12180'];
    txtFieldIdArr[2] = "tf1_lCPTimeout,"+LANG_LOCALE['12186'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;    
        
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_dsnSuffix,Invalid Characters";
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_primaryDns,Invalid Characters";
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_secondaryDns,Invalid Characters";
    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    if (ipv4Validate('tf1_primaryDns', 'IP', true, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
    
    if (ipv4Validate('tf1_secondaryDns', 'IP', true, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
    
    if (ipv4Validate('tf1_cntStAddr', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
    
    if (ipv4Validate('tf1_cntEndAddr', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) ==
    false) 
        return false;
    
    var lcpTimeoutObj = document.getElementById('tf1_lCPTimeout');
    if (numericValueRangeCheck(lcpTimeoutObj, '', '', 1, 999999, true, LANG_LOCALE['11289'], LANG_LOCALE['12732']) == false) 
        return false;
    
    if (ipRangeValidate('tf1_cntStAddr', 'tf1_cntEndAddr') == false) 
        return false;
        
    setHiddenChks(frmId);
    return true;
}
