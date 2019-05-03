/*
 * File: approvedUrlsConfig.js
 * TeamF1 Inc, 2012
 * Created on 8th Nov 2012 - Bala Krishna G
 */
/****
 * validate the form
 * @method pageValidate
 */
function pageValidate(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_url,"+LANG_LOCALE['12178'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
        
    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    if (validateUrlName(document.getElementById('tf1_url'), '') == false) 
        return false;
    return true;
}
/**
 * On submit validation for file type check, this function calls when user clicks on submit button
 * @method validateLansettings
 * @param objId
 * @param exten
 */
function checkFileTypeValid(objId, exten){
    var extObj = document.getElementById(objId);
    var ext = extObj.value;
    ext = ext.substring(ext.lastIndexOf('.') + 1, ext.length);
    ext = ext.toLowerCase();
    if (ext == "") {
        alert(LANG_LOCALE['13441'] + "." + exten + " " + LANG_LOCALE['13473'])
        return false;
    }
    else {
        if (ext.length > 4) {
            alert(LANG_LOCALE['12429'] + "." + exten + LANG_LOCALE['13474']);
            return false;
        }
        else {
            if (ext != exten) {
                alert(LANG_LOCALE['12429'] + "." + ext +  LANG_LOCALE['13474'] + ";" + LANG_LOCALE['12429'] + "." + exten + LANG_LOCALE['13443']);
                return false;
            }
        }

        var fSize = 0;
        if($.browser.msie) {
            var objFSO = new ActiveXObject("Scripting.FileSystemObject");
            var sPath = $("#"+objId)[0].value;
            var objFile = objFSO.getFile(sPath);
            fSize = objFile.size;
            fSize = fSize/ 1024;
        } else {
            fSize = ($("#"+objId)[0].files[0].size);
        }
        
        /* uploaded file size is more than 1 KB, device throws error message */
        if (fSize >= 1024) {
            alert(LANG_LOCALE['80']);
            return false;
        }
    }
    return true;
}

/**
 * validates url
 * @method validateUrl
 * @param urlObj - url object
 */
function validateUrl(urlObj){
    if (!urlObj || urlObj.disabled) 
        return true;
    var url = urlObj.value;
    var errorFlag = false;
    var errorMsg = '';

    /* Check to allow a - z, 0-9, .(dot), -(hyphen), backslash (/) and colon (:) only */
    if (!errorFlag) {
        for (i = 0; i < url.length; i++) {
            if ((url.charCodeAt(i) >= 97 && url.charCodeAt(i) <= 122) || (url.charCodeAt(i) >= 65 && url.charCodeAt(i) <= 90) || (url.charCodeAt(i) >= 48 && url.charCodeAt(i) <= 57) || url.charAt(i) == "." || url.charAt(i) == "-" || url.charAt(i) == "/" || url.charAt(i) == ":") 
                errorFlag = false;
            else {
                errorMsg += LANG_LOCALE['50073'];
                errorFlag = true;
                break;
            }
        }
    }
    
    /* Other Check */
    if (!errorFlag) {
        if (url.charAt(0) == "-" || url.charAt(0) == "." || url.charAt(0) == ":" || url.charAt(0) == "/") {
            errorMsg += LANG_LOCALE['50074'];
           errorFlag = true;
        } else {
            if (url.charAt(url.length - 1) == "-" || url.charAt(url.length - 1) == "." || url.charAt(url.length - 1) == ":" || url.charAt(url.length - 1) == "/") {
                    errorMsg += LANG_LOCALE['50075'];
                    errorFlag = true;
                }
        }
    }
    
    if (errorFlag) {
        alert(errorMsg);
        urlObj.focus();
        return false;
    }

    if (!errorFlag) {
       var regExp = /[a-zA-Z0-9].*:/;

       // If URL starts with http, ftp or any other protocols then we should throw error message.
       if (regExp.test (url)){
           alert(LANG_LOCALE['50139']);
           urlObj.focus();
           return false;
       }
   }
    return true;
}
