/*
 * File: blockedKeywords.js
 * Created on 22nd nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method blockedKeywordsValidate
 */
function blockedKeywordsValidate(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_blockedKeyword,"+LANG_LOCALE['12230'];
    
   /* var txtObj = document.getElementById ('tf1_blockedKeyword');
    if((txtObj.value.indexOf ('.') == 0) && (txtObj.value.length == 1))
      {
       alert(LANG_LOCALE['30433']);
       txtObj.focus ();
       return false;
      }*/
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
    
    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    if (validateUrlName(document.getElementById('tf1_blockedKeyword'), '') == false) 
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
        alert(LANG_LOCALE['13441']+'.' + exten + ' ' + LANG_LOCALE['13473'])
        return false;
    }
    else {
        if (ext.length > 4) {
            alert(LANG_LOCALE['12429']+'.' + exten + ' ' + LANG_LOCALE['13474']);
            return false;
        }
        else {
            if (ext != exten) {
                alert(LANG_LOCALE['13442']+'.' + ext + ' ' + LANG_LOCALE['30414'] + exten + ' ' + LANG_LOCALE['13443']);
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


$(document).ready(function() {	
	onloadCall(contentFilteringOnload, {imageId:'tf1_enableBlockAllURL', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});
	
	contentFilteringOnload({imageId:'tf1_enableBlockAllURL', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});

});
function contentFilteringOnload(data){
	onAnchorToggle(data);
}

function contentFilteringOnReset(){
	contentFilteringOnload({imageId:'tf1_enableBlockAllURL', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});

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
