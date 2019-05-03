/*
 Copyright (c) 2012 TeamF1, Inc.
 All rights reserved.
 */
/**
 * Message Variables
 */
var INVALID_IP = LANG_LOCALE['11280'];
var ENTER_VALUE_BETWEEN = LANG_LOCALE['12162'];
var INVALID_NUMBER = LANG_LOCALE['11310'];
var VALUE_NOT_LESSTHAN = LANG_LOCALE['12164'];
var INVALID_MAC_ADDRESS = LANG_LOCALE['11295'];
var VALID_CHARACTERS = LANG_LOCALE['12237'];
var CHARACTERNOT_SUPPORTED = "\n"+LANG_LOCALE['11023']+":";
var SPACE_CHAR = LANG_LOCALE['12903'];
var MUST_NOT_LESSTHAT = LANG_LOCALE['10926'];
var NOT_ALLOWED_FQDN = LANG_LOCALE['10003'];
var DOUBLE_QUOTE_NOT_ALLOWED = LANG_LOCALE['10002'];
var DOUBLE_QUOTE_NOT_ALLOWED2 = LANG_LOCALE['10814'];
var CHARACTERS_ALLOWED = LANG_LOCALE['10491'];
var ONLY_THIS_CHARACTERS = LANG_LOCALE['11817'];
var ONLY_ANDTHIS_CHARACTERS = LANG_LOCALE['11816'];
var VALID_HOSTNAME = LANG_LOCALE['10938'];
var ONLY_CHARACTERS_ALLOWED = LANG_LOCALE['11815'];
var HOST_NAME_LENGHT = LANG_LOCALE['11123'];
var HOST_NAME_NOT_START = LANG_LOCALE['11124'];
var HOST_NAME_NOT_END = LANG_LOCALE['30424'];
var EMPTY_LABLE = LANG_LOCALE['30425'];
var LABLE_LENGTH = LANG_LOCALE['30426'];
var VALID_HOSTNAME = LANG_LOCALE['10938'];
var ENTER_VALID_DOMAIN = LANG_LOCALE['12004'];
var DOMAIN_CONTAIN = LANG_LOCALE['30427'];
var DOMAIN_START = LANG_LOCALE['10810'];
var DOMAIN_END = LANG_LOCALE['10809'];
var ONLY_NUMBERS_AND = LANG_LOCALE['11814'];
var ONLY_NUMBERS = LANG_LOCALE['11813'];
var VALID_INTEAGER = LANG_LOCALE['12026'];
var ERROR_ON_THIS_PAGE = LANG_LOCALE['13064'];
var NOT_SUPPORTED = LANG_LOCALE['10874'];
var NOT_SUPPORTED_SINGLE_N_DOUBLE_QUOTES = '\' and " characters are not supported for this field';
var NOT_SUPPORTED1 = LANG_LOCALE['30428'];
var COLON_NOT_SUPPORTED = LANG_LOCALE['10001'];

/* Url */
var VALID_URLNAME = LANG_LOCALE['30571'];
var URL_CHARACTERS_ALLOWED = LANG_LOCALE['50143'];
var URL_NAME_LENGHT = LANG_LOCALE['50144'];
var URL_NAME_NOT_START = LANG_LOCALE['50074'];
var URL_NAME_NOT_END = LANG_LOCALE['50075'];
var EMPTY_URL = LANG_LOCALE['50147'];
var URL_LENGTH = LANG_LOCALE['50148'];/**

/**
 * Checks if the field is empty or not
 * @method isFieldEmpty
 * @param fieldId - field Id that is checked for emptyness
 * @param alertFlag - if it is true then show message otherwise not.
 * @param errMsg - message to be shown
 */
function isFieldEmpty(fieldId, alertFlag, errMsg){
    var obj = document.getElementById(fieldId);
    if (!obj || obj.disabled) 
        return false;
    if (!obj.value.length) {
        if (alertFlag) 
            alert(errMsg);
        obj.focus();
        return true;
    }
    return false;
}

/**
 * Wrapper for 'isFieldEmpty'
 * @method txtFieldArrayCheck
 * @param txtFieldIdArr array of fields which needs to be checked for emptyness
 */
function txtFieldArrayCheck(txtFieldIdArr){
    for (var i = 0; i < txtFieldIdArr.length; ++i) {
        var result = false;
        var strArr = txtFieldIdArr[i].split(",");
        result = isFieldEmpty(strArr[0]);
        if (result) {
            if (strArr.length > 1) {
			// below if condition code is added due to facing an issue in Russian language support
				if (strArr.length > 2) {
					var finalStr = '';
					for (var x = 1; x < strArr.length; x++) {
						finalStr += strArr[x]+',';
					}
					finalStr = finalStr.slice(0, -1);
					alert(finalStr);
				}
			 else { 
                alert(strArr[1]);
			}
		}
            return false;
        }
    }
    return true;
}

/**
 * Alerts if some character is not supported in the field
 * @method isProblemCharArrayCheck
 * @param txtFieldIdArr - ',' separated list of fieldIds and messages
 * @param notSupportedChar -
 */
function isProblemCharArrayCheck(txtFieldIdArr, notSupportedChar, msg){
    for (var i = 0; i < txtFieldIdArr.length; ++i) {
        var result = false;
        var strArr = txtFieldIdArr[i].split(",");
        var obj = document.getElementById(strArr[0]);
        if (!obj || obj.disabled) 
            continue;
        else {
            if (strArr.length > 1) {
                for (var unsup = 0; unsup < notSupportedChar.length; unsup++) {
                    if (obj.value.indexOf(notSupportedChar.charAt(unsup)) != -1) {
                        alert(msg);
                        obj.focus();
                        return false;
                    }
                }
            }
        }
    }
    return true;
}

function isProblemCharArrayCheckSingleParam (txtFieldIdArr)
    {

    for (var i = 0; i < txtFieldIdArr.length; ++i)
        {
         var result = false;
         var strArr = txtFieldIdArr[i].split(",");
		 var obj = document.getElementById(strArr[0]);
         if (!obj || obj.disabled)
         	continue;
         else
             {
             if (strArr.length > 1)
             	{
             	if (obj.value.indexOf ("'") != -1 || obj.value.indexOf ("\"") != -1 || obj.value.indexOf (" ") != -1)
             		{
             		    alert (LANG_LOCALE['30429']);
             			obj.focus ();
	            		return false;
	            	}
             	}
             }
         }
    return true;
    }

/**
 * Checks for minimum and maximum length of the field
 * @method fieldLengthCheck
 * @param fieldId - id of of field
 * @param minLen - minimum length
 * @param maxLen - minimum length
 * @param errMsg - error message
 */
function fieldLengthCheck(fieldId, minLen, maxLen, errMsg){
    var fldObj = document.getElementById(fieldId);
    if (!fldObj || fldObj.disabled) 
        return true;
    var strVal = fldObj.value;
    if (minLen && (strVal.length < minLen)) {
        if (errMsg) {
            alert(errMsg);
        }
        fldObj.focus();
        return false;
    }
    if (maxLen && (strVal.length > maxLen)) {
        if (errMsg) {
            alert(errMsg);
        }
        fldObj.focus();
        return false;
    }
    return true;
}

/**
 * Allows only numeric characters to be entered
 * @method numericValueCheck
 * @param eventObj - event obj
 * @param exceptionCharStr - exception characters which are allowed other than numeric characters
 */
function numericValueCheck(eventObj, exceptionCharStr){
    var charUniCode = eventObj.charCode ? eventObj.charCode : eventObj.keyCode;
    /* check for any exceptional characters */
    if (exceptionCharStr) {
        for (i = 0; i < exceptionCharStr.length; ++i) 
            if (exceptionCharStr.charCodeAt(i) == charUniCode) 
                return true;
    }
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
    /* allow back space */
    if (charUniCode < 48 || charUniCode > 57) 
        return false;
    return true;
}

/**
 * Finds the range of numeric value
 * @method numericValueRangeCheck
 * @param srcObj - source object
 * @param minLen - minimum length
 * @param minLenErrStr - Error string
 * @param minVal - Minimum value
 * @param maxVal - Maximum value
 * @param errFlag - If error flag is true shows message
 * @param prefixErrStr - prefix error string
 * @param suffixErrStr - suffix error string
 */
function numericValueRangeCheck(srcObj, minLen, minLenErrStr, minVal, maxVal, errFlag, prefixErrStr, suffixErrStr){
    if (!srcObj || srcObj.disabled) 
        return true;
    var value = parseInt(srcObj.value, 10);
    /* check for minimum length if specified */
    if (minLen && (value.length < minLen)) {
        if (minLenErrStr) {
            alert(minLenErrStr);
        }
        srcObj.focus();
        return false;
    }
    
    if (isNaN(srcObj.value) || srcObj.value.indexOf('+') != -1 || srcObj.value.indexOf('-') != -1 || srcObj.value.indexOf('.') != -1) {
        var errStr = '';
        errStr += INVALID_NUMBER;
        alert(errStr);
        srcObj.focus();
        return false;
    }
    
    value = parseInt(srcObj.value, 10);
    /* value < 0 is added to check for negative values in copy & paste operations */
    if ((minVal && (value < minVal)) || (maxVal && (value > maxVal)) || value < 0) {
        if (errFlag) {
            var errStr = '';
            if (prefixErrStr) 
                errStr += prefixErrStr;
            errStr += ENTER_VALUE_BETWEEN + minVal + " - " + maxVal + " ";
            if (suffixErrStr) 
                errStr += suffixErrStr;
            alert(errStr);
        }
        srcObj.focus();
        return false;
    }
    return true;
}

function numericValueRangeCheck1 (srcObj, minLen, minLenErrStr, minVal, errFlag, prefixErrStr, suffixErrStr)
    {
    
    if (!srcObj || srcObj.disabled) return true;
    var value = srcObj.value;
    /* check for minimum length if specified */
    if (minLen && (value.length < minLen))
            {
            if (minLenErrStr)
                {
                	alert (minLenErrStr);
                }
	        srcObj.focus ();
            return false;
            }
    if (isNaN (value) || srcObj.value.indexOf('+') != -1 || srcObj.value.indexOf('-') != -1 || srcObj.value.indexOf('.') != -1)
        {
        var errStr = '';
        errStr += LANG_LOCALE['11310'];
        	alert (errStr);
        srcObj.focus ();
        return false;
        }
    value = parseInt (srcObj.value, 10);
    if ((minVal && (value < minVal)))
        {
        if (errFlag)
            {
            var errStr = '';
            if (prefixErrStr) errStr += prefixErrStr;
            errStr += " " + LANG_LOCALE['12164'] +
                     minVal + " ";
            if (suffixErrStr) errStr += suffixErrStr; 
            	alert (errStr);
            }
        srcObj.focus ();
        return false;
        }
    return true;
    }

/**
 * Checks if problematic character exists or not
 * @method isProblemChar
 * @param eventObj - event obj
 * @param problemCharStr - problematic characters
 * @param errMsg - error message
 */
function isProblemChar(eventObj, problemCharStr, errMsg){
    var charUniCode = eventObj.charCode ? eventObj.charCode : eventObj.keyCode;
    /* check for any problematic characters */
    if (problemCharStr) {
        for (i = 0; i < problemCharStr.length; ++i) 
            if (problemCharStr.charCodeAt(i) == charUniCode) {
                if (errMsg) {
                    var errStr1 = VALID_CHARACTERS + errMsg;
                    if (problemCharStr.length == 1) {
                        var errStr2 = CHARACTERNOT_SUPPORTED;
                        if (charUniCode == 32) /* Space */ 
                            alert(errStr1 + errStr2 + SPACE_CHAR);
                        else 
                            alert(errStr1 + errStr2 + String.fromCharCode(charUniCode));
                    }
                    else {
                        var errStr3 = errStr1 + VALID_CHARACTERS;
                        for (i = 0; i < problemCharStr.length; ++i) 
                            if (problemCharStr.charCodeAt(i) == 32) /* Space */ 
                                errStr3 += SPACE_CHAR;
                            else 
                                errStr3 += problemCharStr.charAt(i)
                        alert(errStr3);
                    }
                }
                return true;
            }
    }
    return false;
}

/**
 * Checks for port range
 * @method checkPortRange
 * @param strPortId - start port Id
 * @param endPortId - end port Id
 */
function checkPortRange(strPortId, endPortId){
    var strPortObj = document.getElementById(strPortId);
    var endPortObj = document.getElementById(endPortId);
    if (!strPortObj || !endPortObj) 
        return;
    if (strPortObj.disabled || endPortObj.disabled) 
        return true;
    if (isNaN(strPortObj.value)) 
        return true;
    if (isNaN(endPortObj.value)) 
        return true;
    if (parseInt(strPortObj.value, 10) > parseInt(endPortObj.value, 10)) {
        var errStr = MUST_NOT_LESSTHAT;
        alert(errStr);
        return false;
    }
    return true;
}

/**
 * Validates fqdn
 * @method validateFQDN
 * @param fieldId - field Id of field
 */
function validateFQDN(fieldId){
    var fqdnObj = document.getElementById(fieldId);
    if (!fqdnObj || fqdnObj.disabled) 
        return true;
    if (fqdnObj.value.indexOf('@') != -1 || fqdnObj.value.indexOf('\"') != -1) {
        var errorStr = NOT_ALLOWED_FQDN;
        if (fqdnObj.value.indexOf('@') != -1 && fqdnObj.value.indexOf('\"') != -1) 
            errorStr = DOUBLE_QUOTE_NOT_ALLOWED;
        else 
            if (fqdnObj.value.indexOf('\"') != -1) 
                errorStr = DOUBLE_QUOTE_NOT_ALLOWED2;
        
        alert(errorStr);
        return false;
    }
    return true;
}

/**
 * Allows alpha numeric values
 * @method alphaNumericCheck
 * @param eventObj - event object
 * @param exceptionCharStr - exception characters allowed
 */
function alphaNumericCheck(eventObj, exceptionCharStr){
    var charUniCode = eventObj.charCode ? eventObj.charCode : eventObj.keyCode;
    /* check for any exceptional characters */
    if (exceptionCharStr) {
        for (i = 0; i < exceptionCharStr.length; ++i) 
            if (exceptionCharStr.charCodeAt(i) == charUniCode) 
                return true;
    }
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
    /* allow A - F */
    if (charUniCode >= 97 && charUniCode <= 122) 
        return true;
    /* allow A - F */
    if (charUniCode >= 65 && charUniCode <= 90) 
        return true;
    /* allow back space */
    if (charUniCode < 48 || charUniCode > 57) 
        return false;
    return true;
}

/**
 * Allows alpha numeric values, used when submitting the form
 * @method alphaNumericCheck
 * @param eventObj - event object
 * @param exceptionCharStr - exception characters allowed
 * @param prefixErrMsg - prefix error message
 */
function alphaNumericValueCheck(fieldId, exceptionCharStr, prefixErrMsg){
    var txtFieldObj = document.getElementById(fieldId);
    if (!txtFieldObj || txtFieldObj.disabled) 
        return true;
    for (var idx = 0; idx < txtFieldObj.value.length; idx++) {
        var charUniCode = txtFieldObj.value.charCodeAt(idx);
        /* check for any exceptional characters */
        if (exceptionCharStr) {
            var matchFound = false;
            for (i = 0; i < exceptionCharStr.length; ++i) 
                if (exceptionCharStr.charCodeAt(i) == charUniCode) {
                    matchFound = true;
                    break;
                }
            if (matchFound) 
                continue;
        }
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
        /* allow A - F */
        if (charUniCode >= 97 && charUniCode <= 122) 
            continue;
        /* allow A - F */
        if (charUniCode >= 65 && charUniCode <= 90) 
            continue;
        /* allow 0 to 9 */
        if (charUniCode >= 48 && charUniCode <= 57) 
            continue;
        var errorMsg = "";
        if (prefixErrMsg && prefixErrMsg != "") 
            errorMsg += prefixErrMsg;
        if (exceptionCharStr != '') 
            errorMsg += ONLY_THIS_CHARACTERS + exceptionCharStr + ' ' + CHARACTERS_ALLOWED;
        else 
            errorMsg += ONLY_ANDTHIS_CHARACTERS + ' ' + CHARACTERS_ALLOWED;
        
        alert(errorMsg);
        txtFieldObj.focus();
        return false;
    }
    return true;
}

/**
 * validates host name
 * @method validateHostName
 * @param hostNameObj - host name onject
 * @param errorPrefix - error prefix
 */
function validateHostName(hostNameObj, errorPrefix){
    if (!hostNameObj || hostNameObj.disabled) 
        return true;
    var hostName = hostNameObj.value;
    var errorFlag = false;
    var errorMsg = ""
    if (errorPrefix) 
        ;
    errorMsg = errorPrefix + " ";
    if (hostName == "") {
        errorMsg += VALID_HOSTNAME;
        errorFlag = true;
    }
    /* Check to allow a - z, 0-9, .(dot) and -(hyphen) only */
    if (!errorFlag) {
        for (i = 0; i < hostName.length; i++) {
            if ((hostName.charCodeAt(i) >= 97 && hostName.charCodeAt(i) <= 122) || (hostName.charCodeAt(i) >= 48 && hostName.charCodeAt(i) <= 57) || hostName.charAt(i) == "." || hostName.charAt(i) == "-") 
                errorFlag = false;
            else {
                errorMsg += ONLY_CHARACTERS_ALLOWED;
                errorFlag = true;
                break;
            }
        }
    }
    
    /* Other Check */
    if (!errorFlag) {
        if (hostName.length > 255) {
            errorMsg += HOST_NAME_LENGHT;
            errorFlag = true;
        }
        else 
            if (hostName.charAt(0) == "-" || hostName.charAt(0) == ".") {
                errorMsg += HOST_NAME_NOT_START;
                errorFlag = true;
            }
            else 
                if (hostName.charAt(hostName.length - 1) == "-" || hostName.charAt(hostName.length - 1) == ".") {
                    errorMsg += HOST_NAME_NOT_END;
                    errorFlag = true;
                }
                else 
                    if (hostName.indexOf(".") != -1) {
                        var lblsArray = hostName.split(".");
                        for (i = 0; i < lblsArray.length; i++) 
                            if (lblsArray[i].length == 0) {
                                errorMsg += EMPTY_LABLE;
                                errorFlag = true;
                                break;
                            }
                            else 
                                if (lblsArray[i].length > 63) {
                                    errorMsg += LABLE_LENGTH;
                                    errorFlag = true;
                                    break;
                                }
                    }
    }
    
    if (errorFlag) {
        alert(errorMsg);
        hostNameObj.focus();
        return false;
    }
    return true;
}

/**
 * validates keyword
 * @method validateKeyWord
 * @param hostNameObj - host name onject
 * @param errorPrefix - error prefix
 */
function validateKeyWord(hostNameObj, errorPrefix){
    if (!hostNameObj || hostNameObj.disabled) 
        return true;
    var hostName = hostNameObj.value;
    var errorFlag = false;
    var errorMsg = ""
    if (errorPrefix) 
        errorMsg = errorPrefix + " "
    if (hostName == "") {
        errorMsg += VALID_HOSTNAME;
        errorFlag = true;
    }
    /* Check to allow a - z, 0-9, .(dot) and -(hyphen) only */
    if (!errorFlag) {
        for (i = 0; i < hostName.length; i++) {
            if ((hostName.charCodeAt(i) >= 97 && hostName.charCodeAt(i) <= 122) || (hostName.charCodeAt(i) >= 48 && hostName.charCodeAt(i) <= 57) || hostName.charAt(i) == "." || hostName.charAt(i) == "-") 
                errorFlag = false;
            else {
                errorMsg += ONLY_CHARACTERS_ALLOWED;
                errorFlag = true;
                break;
            }
        }
    }
    
    /* Other Check */
    if (!errorFlag) {
        if (hostName.length > 255) {
            errorMsg += HOST_NAME_LENGHT;
            errorFlag = true;
        }
        else 
            if (hostName.indexOf(".") != -1) {
                var lblsArray = hostName.split(".");
                var len = (lblsArray.length) - 1
                for (i = 0; i < lblsArray.length; i++) 
                    if (lblsArray[i].length == 0 && i != 0 && i != len) {
                        errorMsg += EMPTY_LABLE;
                        errorFlag = true;
                        break;
                    }
                    else 
                        if (lblsArray[i].length > 63) {
                            errorMsg += LABLE_LENGTH;
                            errorFlag = true;
                            break;
                        }
            }
    }
    if (errorFlag) {
        alert(errorMsg);
        hostNameObj.focus();
        return false;
    }
    return true;
}

/**
 * validates keyword
 * @method validateKeyWord
 * @param hostNameObj - host name onject
 * @param errorPrefix - error prefix
 */
function checkHostName(fieldId, errorFlag, customMsg, emptyFlag){
    var fieldObj = document.getElementById(fieldId);
    if (!fieldObj || fieldObj.disabled) 
        return true;
    var hostName = fieldObj.value;
    /* Check if host name Empty */
    if (hostName == "" && emptyFlag) {
        return true;
    }
    else 
        if (hostName == "") {
            var errMsg = ENTER_VALID_DOMAIN;
            if (customMsg != "") {
                errMsg = customMsg + errMsg;
                alert(errMsg);
                fieldObj.focus();
                return false;
            }
        }
    /* Check host name rules */
    var isInvalid = false
    for (var idx = 0; idx < hostName.length; idx++) {
        var exceptionChars = "-.";
        var charCode = hostName.charCodeAt(idx);
        if (!((charCode >= 97 && charCode <= 122) || (charCode >= 65 && charCode <= 90) || (charCode >= 48 && charCode <= 57) || charCode == exceptionChars.charCodeAt(0) || charCode == exceptionChars.charCodeAt(1))) {
            isInvalid = true;
            break;
        }
    }
    if (isInvalid) {
        var errMsg = DOMAIN_CONTAIN;
        if (customMsg != "") {
            errMsg = customMsg + errMsg;
            alert(errMsg);
            fieldObj.focus();
            return false;
        }
    }
    var firstChar = hostName.charCodeAt(0)
    if (!((firstChar >= 97 && firstChar <= 122) || (firstChar >= 65 && firstChar <= 90) || (firstChar >= 48 && firstChar <= 57))) {
        var errMsg = DOMAIN_START;
        if (customMsg != "") {
            errMsg = customMsg + errMsg;
            alert(errMsg);
            fieldObj.focus();
            return false;
        }
    }
    var lastChar = hostName.charCodeAt(hostName.length - 1)
    if (!((lastChar >= 97 && lastChar <= 122) || (lastChar >= 65 && lastChar <= 90) || (lastChar >= 48 && lastChar <= 57))) {
        var errMsg = DOMAIN_END;
        if (customMsg != "") {
            errMsg = customMsg + errMsg;
            alert(errMsg);
            fieldObj.focus();
            return false;
        }
    }
    return true;
}

/**
 * checks for valid integer value
 * @method isNumericValue
 * @param 'fieldId' id for the field
 */
function isNumericValue(fieldId){
    try {
        var fieldIdObj = document.getElementById(fieldId);
        if (fieldIdObj && !fieldIdObj.disabled) {
            if (isNaN(parseInt(fieldIdObj.value, 10))) {
                alert(VALID_INTEAGER);
                fieldIdObj.focus();
                return false;
            }
            else {
                return true;
            }
        }
    } 
    catch (err) {
        alert(ERROR_ON_THIS_PAGE);
        return false;
    }
}

function numericValueCheck1 (fieldId, exceptionCharStr)
{
    var txtFieldObj = document.getElementById (fieldId);
	var errorDisplayObj = document.getElementById (fieldId + "Err");
	    
	if (!txtFieldObj || txtFieldObj.disabled) return true;
	
	for (var idx = 0; idx < txtFieldObj.value.length; idx++)
		{
		var charUniCode = txtFieldObj.value.charCodeAt (idx);
		
	    /* check for any exceptional characters */
		if (exceptionCharStr)
	        {
	        var matchFound = false;
	        for (i=0; i < exceptionCharStr.length; ++i)
	        	if (exceptionCharStr.charCodeAt (i) == charUniCode) { matchFound = true; break; }

		    if (matchFound) continue;
	        }
	    switch (charUniCode)
	        {
	        case 8:  /* back space */
	        case 9:  /* tab */
	        case 16: /* shift */
	        /* case 37: */ /* left arrow */
	        /* case 39: */ /* right arrow */
	        /* case 46: */ /* delete - not supporting as in netscape it's char code is same as '.'*/ 
	             return true;
	        default:
	             break;
	        }

		/* allow 0 to 9 */
	    if (charUniCode >= 48 && charUniCode <= 57) continue;
  
	    var errorMsg = "";
	    if(exceptionCharStr != '')
	        errorMsg += LANG_LOCALE['11814'] + exceptionCharStr + LANG_LOCALE['10491'];
	    else
	        errorMsg += LANG_LOCALE['11813'] + LANG_LOCALE['10491'];
	    
		if (errorDisplayObj)
		    alert (errorMsg);
		txtFieldObj.focus();
		return false;
        }

    return true;
}


/**
 * Allows alpha numeric values
 * @method specialCharCheck
 * @param eventObj - event object
 * @param exceptionCharStr - exception characters allowed
 */
function specialCharCheck(eventObj, exceptionCharStr) {
    var charUniCode = eventObj.charCode ? eventObj.charCode : eventObj.keyCode;
    /* check for any exceptional characters */
    if (exceptionCharStr) {
        for ( i = 0; i < exceptionCharStr.length; ++i)
            if (exceptionCharStr.charCodeAt(i) == charUniCode)
                return true;
    }
    switch (charUniCode) {
        case 8:
        /* back space */
        case 9:
        /* tab */
        case 16:
            /* shift */
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
    /* allow A - F */
    if (charUniCode >= 97 && charUniCode <= 122)
        return true;
    /* allow A - F */
    if (charUniCode >= 65 && charUniCode <= 90)
        return true;
    /* disallow "" ''*/
    if (charUniCode == 34 || charUniCode == 39)
        return false;
    /* allow back space 
    if (charUniCode < 48 || charUniCode > 57)
        return false; */
    return true;
}
/*
 * validates Url name
 * @method validateUrlName
 * @param hostNameObj - host name onject
 * @param errorPrefix - error prefix
 */
function validateUrlName(hostNameObj, errorPrefix){
    if (!hostNameObj || hostNameObj.disabled) 
        return true;
    var hostName = hostNameObj.value;
    var errorFlag = false;
    var errorMsg = ""
    if (errorPrefix) 
        ;
    errorMsg = errorPrefix + " ";
    if (hostName == "") {
        errorMsg += VALID_URLNAME;
        errorFlag = true;
    }
    /* Check to allow a - z, 0-9, .(dot), -(hyphen), backslash (/), star (*) and colon (:) only */
    if (!errorFlag) {
        for (i = 0; i < hostName.length; i++) {
            if ((hostName.charCodeAt(i) >= 97 && hostName.charCodeAt(i) <= 122) || (hostName.charCodeAt(i) >= 48 && hostName.charCodeAt(i) <= 57) || hostName.charAt(i) == "." || hostName.charAt(i) == "-" || hostName.charAt(i) == "*" || hostName.charAt(i) == ":" || hostName.charAt(i) == "/") 
                errorFlag = false;
            else {
                errorMsg += URL_CHARACTERS_ALLOWED;
                errorFlag = true;
                break;
            }
        }
    }
    
    /* Other Check */
    if (!errorFlag) {
        if (hostName.length > 255) {
            errorMsg += URL_NAME_LENGHT;
            errorFlag = true;
        }
        else 
            if (hostName.charAt(0) == "-" || hostName.charAt(0) == "." || hostName.charAt(0) == ":" || hostName.charAt(0) == "/") {
                errorMsg += URL_NAME_NOT_START;
                errorFlag = true;
            }
            else 
                if (hostName.charAt(hostName.length - 1) == "-" || hostName.charAt(hostName.length - 1) == "." || hostName.charAt(hostName.length - 1) == ":" || hostName.charAt(hostName.length - 1) == "/") {
                    errorMsg += URL_NAME_NOT_END;
                    errorFlag = true;
                }
                else 
                    if (hostName.indexOf(".") != -1) {
                        var lblsArray = hostName.split(".");
                        for (i = 0; i < lblsArray.length; i++) 
                            if (lblsArray[i].length == 0) {
                                errorMsg += URL_LABLE;
                                errorFlag = true;
                                break;
                            }
                            else 
                                if (lblsArray[i].length > 63) {
                                    errorMsg += URL_LENGTH;
                                    errorFlag = true;
                                    break;
                                }
                    }
    }
    
    if (errorFlag) {
        alert(errorMsg);
        hostNameObj.focus();
        return false;
    }
    return true;
}

function preventSpaceChar (txtFieldIdArr)
    {

    for (var i = 0; i < txtFieldIdArr.length; ++i)
        {
         var result = false;
         var strArr = txtFieldIdArr[i].split(",");
		 var obj = document.getElementById(strArr[0]);
         if (!obj || obj.disabled)
         	continue;
         else
             {
             if (strArr.length > 1)
             	{
             	if (obj.value.indexOf (" ") != -1)
             		{
             		    alert ('Space character is not allowed for server/client name.');
             			obj.focus ();
	            		return false;
	            	}
             	}
             }
         }
    return true;
    }


