/*
 * File: intelAmt.js
 * Created on 5th Nov 2012 - Vivek
 * Modified on 13th Dec 2012 - Lakshmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */ 

$(document).ready(function(){    
	enableTextFieldByAnchorClick('tf1_imgPort','tf1_selWanHosts1 tf1_selWanHosts2 tf1_txtWanHosts tf1_txtLocalServerIp','break1 break2 break3');  	 
	enableTextFieldByAnchorClick('tf1_imgReflector','tf1_imgRedirect16992 tf1_imgRedirect16993 tf1_imgRedirect16994 tf1_imgRedirect16995 tf1_imgRedirect9971 tf1_txtRedirectPort16992 tf1_txtRedirectPort16993 tf1_txtRedirectPort16994 tf1_txtRedirectPort16995 tf1_txtRedirectPort9971','break5 break6 break7 break8 break9');  
    onloadCall(setIntlAmtFlds, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});   
    showBasedOnActive('tf1_imgRedirect16992','tf1_txtRedirectPort16992');
    showBasedOnActive('tf1_imgRedirect16993','tf1_txtRedirectPort16993');	
	showBasedOnActive('tf1_imgRedirect16994','tf1_txtRedirectPort16994');
	showBasedOnActive('tf1_imgRedirect16995','tf1_txtRedirectPort16995');
	showBasedOnActive('tf1_imgRedirect9971','tf1_txtRedirectPort9971'); 
	enableHostTextField('tf1_selWanHosts1');
});

/**
 * Enable Host Text Field
 * @method enableHostTextField
 * This function calls when user selects "WAN Hosts" as "Specify Option IPs"
 */
function enableHostTextField(radioName){
    var selObjVal = radioCheckedValueGet(radioName);
    if (!selObjVal) 
        return;
    if (selObjVal == 1) {
        fieldStateChangeWr('tf1_txtWanHosts', '', '', '');
        vidualDisplay('tf1_txtWanHosts', 'hide');
        vidualDisplay('break3', 'hide');
    }else {
        fieldStateChangeWr('', '', 'tf1_txtWanHosts', '');
        vidualDisplay('tf1_txtWanHosts', 'configRow');
        vidualDisplay('break3', 'break');
    }
}

/**
 * Enable Fields
 * @method setIntlAmtFlds
 * @param data its object data in case we need it. Pass '' if not needed
 * @param thisObj object refers to the object being clicked
 */
function setIntlAmtFlds(data, thisObj){
    var that = thisObj;
    var imgId= that.id;
    switch (imgId) {
        case 'tf1_imgPort': 
        	enableTextFieldByAnchorClick(imgId,'tf1_selWanHosts1 tf1_selWanHosts2 tf1_txtWanHosts tf1_txtLocalServerIp','break1 break2 break3');       
            enableHostTextField('tf1_selWanHosts1');
            break;
        case 'tf1_imgReflector':     	
			var imgObjVal = document.getElementById(imgId).className;    
    		var imageName = imgObjVal.substring (imgObjVal.lastIndexOf ('/') + 1);
   			if (imageName == OFF_ANCHOR) {
        		fieldStateChangeWr ('tf1_imgRedirect16992 tf1_imgRedirect16993 tf1_imgRedirect16994 tf1_imgRedirect16995 tf1_imgRedirect9971 tf1_txtRedirectPort16992 tf1_txtRedirectPort16993 tf1_txtRedirectPort16994 tf1_txtRedirectPort16995 tf1_txtRedirectPort9971', '', '', '');   
        		vidualDisplay ('tf1_imgRedirect16992 tf1_imgRedirect16993 tf1_imgRedirect16994 tf1_imgRedirect16995 tf1_imgRedirect9971 tf1_txtRedirectPort16992 tf1_txtRedirectPort16993 tf1_txtRedirectPort16994 tf1_txtRedirectPort16995 tf1_txtRedirectPort9971','hide');
        		vidualDisplay('break5 break6 break7 break8 break9', 'hide');
        		
        		
        	}else{
        		fieldStateChangeWr ('tf1_txtRedirectPort16992 tf1_txtRedirectPort16993 tf1_txtRedirectPort16994 tf1_txtRedirectPort16995 tf1_txtRedirectPort9971', '', 'tf1_imgRedirect16992 tf1_imgRedirect16993 tf1_imgRedirect16994 tf1_imgRedirect16995 tf1_imgRedirect9971', '');
        		vidualDisplay ('tf1_txtRedirectPort16992 tf1_txtRedirectPort16993 tf1_txtRedirectPort16994 tf1_txtRedirectPort16995 tf1_txtRedirectPort9971','hide');
        		vidualDisplay ('tf1_imgRedirect16992 tf1_imgRedirect16993 tf1_imgRedirect16994 tf1_imgRedirect16995 tf1_imgRedirect9971','configRow');
        		vidualDisplay('break5 break6 break7 break8 break9', 'break');
        		showBasedOnActive('tf1_imgRedirect16992','tf1_txtRedirectPort16992');
        		showBasedOnActive('tf1_imgRedirect16993','tf1_txtRedirectPort16993');	
				showBasedOnActive('tf1_imgRedirect16994','tf1_txtRedirectPort16994');
				showBasedOnActive('tf1_imgRedirect16995','tf1_txtRedirectPort16995');
				showBasedOnActive('tf1_imgRedirect9971','tf1_txtRedirectPort9971');
        	}     	 
            break;
        case 'tf1_imgRedirect16992':
        	enableTextFieldByAnchorClick(imgId,'tf1_txtRedirectPort16992','');             
            break;
        case 'tf1_imgRedirect16993':
        	enableTextFieldByAnchorClick(imgId,'tf1_txtRedirectPort16993','');             
            break;
        case 'tf1_imgRedirect16994':
        	enableTextFieldByAnchorClick(imgId,'tf1_txtRedirectPort16994','');            
            break;
        case 'tf1_imgRedirect16995':
        	enableTextFieldByAnchorClick(imgId,'tf1_txtRedirectPort16995','');           
            break;
        case 'tf1_imgRedirect9971':
        	enableTextFieldByAnchorClick(imgId,'tf1_txtRedirectPort9971','');            
            break;
    }    
}
function showBasedOnActive(imgFld,txtFld){
	var imgObjVal = document.getElementById(imgFld).className;    
    var imageName = imgObjVal.substring (imgObjVal.lastIndexOf ('/') + 1);
   	if (imageName == ON_ANCHOR) {
   		fieldStateChangeWr ('', '', txtFld, '');
   		vidualDisplay(txtFld,'configRow');
   	}else{
	   	fieldStateChangeWr (txtFld, '', '', '');
   		vidualDisplay(txtFld,'hide');
   	}   	
}

/**
 * On submit validation
 * @method intelAmtValidation
 * This function calls when user clicks on submit button
 */
function intelAmtValidation(frmId){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_txtWanHosts,"+LANG_LOCALE['12415'];
    txtFieldIdArr[1] = "tf1_txtLocalServerIp,"+LANG_LOCALE['12027'];
    txtFieldIdArr[2] = "tf1_txtRedirectPort16992,"+LANG_LOCALE['12084']+"16992";
    txtFieldIdArr[3] = "tf1_txtRedirectPort16993,"+LANG_LOCALE['12084']+"16993";
    txtFieldIdArr[4] = "tf1_txtRedirectPort16994,"+LANG_LOCALE['12084']+"16994";
    txtFieldIdArr[5] = "tf1_txtRedirectPort16995,"+LANG_LOCALE['12084']+"16995";
    txtFieldIdArr[6] = "tf1_txtRedirectPort9971,"+LANG_LOCALE['12084']+"9971";
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;        
    
    if (numericValueCheck('tf1_txtWanHosts', '.,') == false) {
        return false;
    }else {
        var wanHost = document.getElementById('tf1_txtWanHosts');
        if (wanHost && !wanHost.disabled) {
            var ipAddrArr = wanHost.value.split(',');
            for (var i = 0; i < ipAddrArr.length; i++) {
                if (ipAddrArr[i] == "") {
                    alert(LANG_LOCALE['11376']);
                    return false;
                }
                else {
                    var obj = document.getElementById('tf1_txtWanHosts');
                    if (ipv4ValidateStr(obj, ipAddrArr[i], 'IP', false, true, LANG_LOCALE['11376'], LANG_LOCALE['11031'], true) == false) 
                        return false;
                }
            }
        }
    }    
    if (ipv4Validate('tf1_txtLocalServerIp', 'IP', false, true, LANG_LOCALE['11280'], LANG_LOCALE['11031'], true) == false) 
        return false;
        
    if (numericValueRangeCheck(document.getElementById('tf1_txtRedirectPort16992'), '', '', 1, 65535, true, LANG_LOCALE['11333']+'16992.', '') == false) 
        return false;
    if (numericValueRangeCheck(document.getElementById('tf1_txtRedirectPort16993'), '', '', 1, 65535, true, LANG_LOCALE['11333']+'16993.', '') == false) 
        return false;
    if (numericValueRangeCheck(document.getElementById('tf1_txtRedirectPort16994'), '', '', 1, 65535, true, LANG_LOCALE['11333']+'16994.', '') == false) 
        return false;
    if (numericValueRangeCheck(document.getElementById('tf1_txtRedirectPort16995'), '', '', 1, 65535, true, LANG_LOCALE['11333']+'16995.', '') == false) 
        return false;
    if (numericValueRangeCheck(document.getElementById('tf1_txtRedirectPort9971'), '', '', 1, 65535, true, LANG_LOCALE['11333']+'9971.', '') == false) 
        return false;
        
    setHiddenChks(frmId);
    return true;
}

function intelAmtOnReset(frmId) {
	
	resetImgOnOff(frmId);
	enableTextFieldByAnchorClick('tf1_imgPort','tf1_selWanHosts1 tf1_selWanHosts2 tf1_txtWanHosts tf1_txtLocalServerIp','break1 break2 break3');  	 
	enableTextFieldByAnchorClick('tf1_imgReflector','tf1_imgRedirect16992 tf1_imgRedirect16993 tf1_imgRedirect16994 tf1_imgRedirect16995 tf1_imgRedirect9971 tf1_txtRedirectPort16992 tf1_txtRedirectPort16993 tf1_txtRedirectPort16994 tf1_txtRedirectPort16995 tf1_txtRedirectPort9971','break5 break6 break7 break8 break9');     
    enableHostTextField('tf1_selWanHosts1');
}
