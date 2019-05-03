/*
 * File: wds.js
 * Created on 13th Mar 2013 - Lakshmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 * This function calls at the time of page loads
 * OnLoad validation
 * @method wdsOnload
 */
$(document).ready(function(){
	
    onloadCall(wdsOnload, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});
    securityChange ();
});

function wdsOnload (data, thisObj)
    {
	onAnchorToggle(data);
    securityChange ();
    } 

/*
 * Function reset of the form */
function wdsOnReset(frmId) {

	resetImgOnOff(frmId);
	securityChange ();
}

function securityChange ()
    {
    var hdSecurityObj = document.getElementById ('hdSecurity');
    fieldStateChangeWr ('tf1_txtWPAPasswd', '', '', '');
    vidualDisplay('tf1_txtWPAPasswd break5', 'hide');
    if(hdSecurityObj && hdSecurityObj.value != "OPEN" && hdSecurityObj.value != "WEP")
        {
        var imgObj = document.getElementById("tf1_image_OnOff");
        if (imgObj)
            {
		    var currentClass=$(imgObj).attr("class");
            if (currentClass == ON_ANCHOR)
                {
                fieldStateChangeWr ('', '', 'tf1_txtWPAPasswd', '');
                vidualDisplay('tf1_txtWPAPasswd', 'configRow');
                vidualDisplay('break5', 'break');
                }
            }
        }
    }

 /**
 * This function calls when user clicks on submit button.
 * OnSubmit validation
 * @method validateIpMacBingingConfig
 */
function validatewdsConfig(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_txtMacAddr, "+LANG_LOCALE['12048'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
    
    var macObj = document.getElementById('tf1_txtMacAddr');
    if (!(macAddrValidate(macObj.value, true, "", '', macObj))) {
	        macObj.focus();
	        return false;
    }
       
    return true;
}

/**
 * This function calls when user clicks on submit button.
 * OnSubmit validation
 * @method validateIpMacBingingConfig
 */
function pageValidate(frmId){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_txtWPAPasswd, Please enter valid WDS-Passphrase.";
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
    
    var wpaPasswd = document.getElementById('tf1_txtWPAPasswd');
    if(wpaPasswd&& !wpaPasswd.disbaled){
		if(fieldLengthCheck('tf1_txtWPAPasswd', 8, 63, 'Invalid WDS Passphrase: Please enter key with length between 8 - 63 characters') == false){
                        wpaPasswd.focus();
			return false;
                }
	}
    setHiddenChks(frmId);   
    return true;
}
