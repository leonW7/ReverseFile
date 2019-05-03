/*
 * File: dynamicDns.js
 * Created on 23rd nov 2012 - Vivek
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 * ddns field validation
 * OnSubmit event
 * @method ddnsValidate
 */
function ddnsValidate(frmId){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_userName1, "+LANG_LOCALE['12144'];
    txtFieldIdArr[1] = "tf1_domainName1, "+LANG_LOCALE['12002'];
    txtFieldIdArr[2] = "tf1_Password1, "+LANG_LOCALE['12074'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
    
    if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;
    
    if (!validateFQDN('tf1_domainName1')) 
        return false;
        
    setHiddenChks(frmId);    
    return true;
    
}

/**
 * ddns field validation
 * @method selectDdnsOption1
 * @param selectRadioName - radio name
 */
function selectDdnsOption1(selectRadioName){
    var selectRadioNameValue = radioCheckedValueGet(selectRadioName);
    switch (selectRadioNameValue) {
        case '1':
            //DynDNS
            fieldStateChangeWr('', '', 'tf1_userName1 tf1_domainName1 tf1_Status1 tf1_Password1', '');
            vidualDisplay('tf1_userName1 tf1_domainName1 tf1_Status1 tf1_Password1 tf1_wildCard tf1_updatePeriodically', 'configRow');
            vidualDisplay('break2 break4 break5 break6 break7 break8 break9', 'break');
     		vidualDisplay('tf1_oray','hide');
            break;
        case '2':
            //ORAY
            fieldStateChangeWr('tf1_domainName1 tf1_Status1', '', 'tf1_userName1 tf1_Password1', '');
            vidualDisplay('tf1_domainName1 tf1_wildCard tf1_updatePeriodically tf1_Status1 break4 break5 break8 break9', 'hide');
            vidualDisplay('tf1_userName1 tf1_Password1', 'configRow');
            vidualDisplay('break2 break6 break7', 'break');
			vidualDisplay('tf1_oray','');
            break;
        case '3':
            //DLINKDDNS
            fieldStateChangeWr('', '', 'tf1_userName1 tf1_domainName1 tf1_Password1', '');
            vidualDisplay('tf1_wildCard tf1_updatePeriodically break5 break9', 'hide');
            vidualDisplay('tf1_userName1 tf1_domainName1 tf1_Password1 tf1_Status1', 'configRow')
            vidualDisplay('break2 break4 break6 break7 break5', 'break');
			vidualDisplay('tf1_oray','hide');			
            break;
        case '4':
            //None
            fieldStateChangeWr('tf1_userName1 tf1_domainName1 tf1_Status1 tf1_Password1', '', '', '');
            vidualDisplay('tf1_userName1 tf1_domainName1 tf1_Status1 tf1_Password1 tf1_wildCard tf1_updatePeriodically break2 break4 break5 break6 break7 break8 break9', 'hide');
			vidualDisplay('tf1_oray','hide');			
            break;
            
        default:
            break;
            
    }
}

// Call onload
window.onload = function(){
    onloadCall();
    selectDdnsOption1('tf1_NTPDynDNS');    
}

function dynamicDnsOnReset(){
	selectDdnsOption1('tf1_NTPDynDNS');
}
