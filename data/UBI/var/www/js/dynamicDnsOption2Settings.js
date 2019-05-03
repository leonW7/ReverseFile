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
    txtFieldIdArr[0] = "tf1_userName2, "+LANG_LOCALE['12144'];
    txtFieldIdArr[1] = "tf1_domainName2, "+LANG_LOCALE['12002'];
    txtFieldIdArr[2] = "tf1_Password2, "+LANG_LOCALE['12074'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
    
    if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;
    
    if (!validateFQDN('tf1_domainName2')) 
        return false;
    setHiddenChks('tf1_frmDynamicDnsOption2Settings');
    return true;
    
}

/**
 * ddns field validation
 * @method selectDdnsOption2
 * @param selectRadioName - radio name
 */
function selectDdnsOption2(selectRadioName){
    var selectRadioNameValue = radioCheckedValueGet(selectRadioName);
    switch (selectRadioNameValue) {
        case '1':
            //DynDNS
            fieldStateChangeWr('', '', 'tf1_userName2 tf1_domainName2 tf1_Status2 tf1_Password2', '');
            vidualDisplay('tf1_userName2 tf1_domainName2 tf1_Status2 tf1_Password2 tf1_wildCard2 tf1_updatePeriodically2', 'configRow');
            vidualDisplay('break11 break13 break14 break15 break16 break17 break18', 'break');
			vidualDisplay('tf1_oray','hide');			
            break;
        case '2':
            //ORAY
            fieldStateChangeWr('tf1_domainName2 tf1_Status2', '', 'tf1_userName2 tf1_Password2', '');
            vidualDisplay('tf1_domainName2 tf1_wildCard2 tf1_updatePeriodically2 tf1_Status2 break13 break14 break17 break18', 'hide');
            vidualDisplay('tf1_userName2 tf1_Password2', 'configRow');
            vidualDisplay('break11 break13 break15 break16', 'break');
			vidualDisplay('tf1_oray','');			
            break;
        case '3':
            //DLINKDDNS
            fieldStateChangeWr('', '', 'tf1_userName2 tf1_domainName2 tf1_Password2', '');
            vidualDisplay('tf1_wildCard2 tf1_updatePeriodically2 break14 break17 break18', 'hide');
            vidualDisplay('tf1_userName2 tf1_domainName2 tf1_Password2 tf1_Status2', 'configRow')
            vidualDisplay('break11 break13 break15 break16 break14', 'break');
			vidualDisplay('tf1_oray','hide');			
            break;
        case '4':
            //None
            fieldStateChangeWr('tf1_userName2 tf1_domainName2 tf1_Status2 tf1_Password2', '', '', '');
            vidualDisplay('tf1_userName2 tf1_domainName2 tf1_Status2 tf1_Password2 tf1_wildCard2 tf1_updatePeriodically2  break13 break14 break15 break16 break17 break18', 'hide');
            vidualDisplay('break11', 'break');
			vidualDisplay('tf1_oray','hide');			
            break;
            
        default:
            break;
            
    }
}

// Call onload
window.onload = function(){
    onloadCall();
    selectDdnsOption2('tf1_NTPDynDNSOption2');
}

function dynamicDnsOption2SettingsOnReset(){
    selectDdnsOption2('tf1_NTPDynDNSOption2');
}
