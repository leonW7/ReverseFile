/*
 * File: staticRoutingConfig.js
 * Created on 20th nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */

/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method staticRoutingConfigValidate
 */
function staticRoutingConfigValidate(frmId){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_txtRouteName,"+LANG_LOCALE['12368'];
    txtFieldIdArr[1] = "tf1_txtDestIpAddr,"+LANG_LOCALE['12251'];
    txtFieldIdArr[2] = "tf1_txtDestSnetMask,"+LANG_LOCALE['12293'];
    txtFieldIdArr[3] = "tf1_txtGwIpAddr,"+LANG_LOCALE['12184'];
    txtFieldIdArr[4] = "tf1_txtMetric,"+LANG_LOCALE['12187'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

    if (alphaNumericValueCheck ("tf1_txtRouteName", '', '') == false)    
        return false;

    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
  
    var routeNameObj = document.getElementById("tf1_txtRouteName");
    if(routeNameObj && !routeNameObj.disabled){

        if(validRouteName ('tf1_txtRouteName' ,LANG_LOCALE['11342']) == false)
            return false;
    }

 
     
    if (ipv4Validate('tf1_txtDestIpAddr', 'SN', false, true, LANG_LOCALE['11281']+'. ', LANG_LOCALE['11031'], true) == false) 
        return false;
    
    if (validNetMask('tf1_txtDestSnetMask') == false) 
        return false;
    
    if (ipv4Validate('tf1_txtGwIpAddr', 'IP', false, true, LANG_LOCALE['11281']+'. ', LANG_LOCALE['11031'], true) == false) 
        return false;
    
    var metricObj = document.getElementById('tf1_txtMetric');
    if (numericValueRangeCheck(metricObj, '', '', 2, 15, true, LANG_LOCALE['11303']+'. ', ' ') == false) 
        return false;
        
    setHiddenChks(frmId);     
    return true;
}

/**
 * Allows alpha numeric values, used when submitting the form
 * @method validGroupName
 * @param eventObj - event object
 * @param exceptionCharStr - exception characters allowed
 * @param prefixErrMsg - prefix error message
 */
function validRouteName (fieldId, prefixErrMsg){
    var txtFieldObj = document.getElementById(fieldId);

    if (!txtFieldObj || txtFieldObj.disabled)
        return true;

    for (var idx = 0; idx < txtFieldObj.value.length; idx++) {
        var charUniCode = txtFieldObj.value.charCodeAt(idx);

        switch (charUniCode) {
            case 8: /* back space */
            case 9: /* tab */
            case 16: /* shift */
                /* case 37: */
                /* left arrow */
                /* case 39: */
                /* right arrow */
                /* case 46: */
                /* delete - not supporting as in netscape it's char code is same as '.'*/
                return true;
            default:
                break;
        }
        /* allow A - Z */
	if (charUniCode >= 97 && charUniCode <= 122)
            continue;
        /* allow a - z */
        if (charUniCode >= 65 && charUniCode <= 90)
            continue;
        /* allow 0 to 9 */
        if (charUniCode >= 48 && charUniCode <= 57)
            continue;
        var errorMsg = "";
        if (prefixErrMsg && prefixErrMsg != "")
            errorMsg += prefixErrMsg;
        errorMsg += ONLY_ANDTHIS_CHARACTERS + " " + CHARACTERS_ALLOWED;
        alert(errorMsg);
        txtFieldObj.focus();
        return false;
    }
    return true;
}

