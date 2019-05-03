/*
 * File: advertisementPrefixesConfig.js
 * TeamF1 Inc, 2012
 * Created on 9th Nov 2012 - Bala Krishna G
 */
// Call onload
function onLoadCallAdvertisementPrefix(){
    onloadCall();
    advPrefixConfig('tf1_6to4');
}

/****
 * validate the form
 * @method advertisementPrefixValidate
 */
function advertisementPrefixValidate(frmId){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "txtIntName,"+LANG_LOCALE['12033'];
    txtFieldIdArr[1] = "tf1_slaId,"+LANG_LOCALE['12122'];
    txtFieldIdArr[2] = "tf1_prefix,"+LANG_LOCALE['12035'];
    txtFieldIdArr[3] = "tf1_ipv6PreLen,"+LANG_LOCALE['12036'];
    txtFieldIdArr[4] = "tf1_prefLifeTime,"+LANG_LOCALE['12088'];
    txtFieldIdArr[5] = "tf1_vlanInterface,"+LANG_LOCALE['136'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
        
    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    if (ipv6Validate('tf1_prefix', false, true, '') == false) 
        return false;
    
    var slaObj = document.getElementById('tf1_slaId');
    if (numericValueRangeCheck(slaObj, '', '', 0, 999, true, LANG_LOCALE['13643']+': ', '') == false) 
        return false;

    var preLenObj = document.getElementById('tf1_ipv6PreLen');
    if (numericValueRangeCheck(preLenObj, '', '', 0, 128, true, LANG_LOCALE['11286']+': ', '') == false) 
        return false;
    
    return numericValueRangeCheck(document.getElementById('tf1_prefLifeTime'), '', '', 5, 65536, true, LANG_LOCALE['11322']+': ', LANG_LOCALE['12732']);
    setHiddenChks(frmId);
    return true;
}

/**
 * enables/disables respective fields based on '6to4' or 'global/local' selection
 * @method advPrefixConfig
 */
function advPrefixConfig(radioId){
    var selValue = radioCheckedValueGet(radioId);
    if (!selValue) 
        return;
    switch (parseInt(selValue, 10)) {
        case 1: /* 6to4 */
            fieldStateChangeWr('tf1_prefix tf1_ipv6PreLen', '', 'tf1_slaId', '');
            vidualDisplay('tf1_prefix tf1_ipv6PreLen break2 break3', 'hide');
            vidualDisplay('tf1_slaId', 'configRow');
            vidualDisplay('break1', 'break');
            break;
        case 2: /* global/local */
        case 3:
            fieldStateChangeWr('tf1_slaId', '', 'tf1_prefix tf1_ipv6PreLen', '');
            vidualDisplay('tf1_slaId break1', 'hide');
            vidualDisplay('tf1_prefix tf1_ipv6PreLen', 'configRow');
            vidualDisplay('break2 break3', 'break');
            break;
            
    }
}
