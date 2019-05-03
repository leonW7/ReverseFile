/*
 * File: profileConfig.js
 * Created on 17th Jan 2013 - Lakshmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 * This function calls Page loads
 * Onload validation
 * @method onloadCall
 */
function onLoadProfilesFn () {
        
                onloadCall (enableDisableFieldsByImageClick, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});
		profileSecurityCheck();      
        enableTextFieldByAnchorClick('tf1_enablemfp','tf1_forcemfp','break_forcemfp');

            }

function enableDisableFieldsByImageClick(data, thisObj) { 
    onAnchorToggle (data);
    var imgId=thisObj.id;
    
    switch(imgId) {
    	case 'tf1_enablemfp':
    		enableTextFieldByAnchorClick(imgId,'tf1_forcemfp','break_forcemfp');    		
    	break;
  
    }
}
/**
 * Form Validation
 * @method profileConfValidate
 */
function profileConfValidate(frmId){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_txtProfName,"+LANG_LOCALE['12348'];
    txtFieldIdArr[1] = "tf1_txtSSID,"+LANG_LOCALE['12177'];
    txtFieldIdArr[2] = "tf1_txtWPAPasswd,"+LANG_LOCALE['12423'];
    txtFieldIdArr[3] = "tf1_txtWepKey1,"+LANG_LOCALE['12422'];
    txtFieldIdArr[4] = "tf1_txtWepKey2,"+LANG_LOCALE['12422'];
    txtFieldIdArr[5] = "tf1_txtWepKey3,"+LANG_LOCALE['12422'];
    txtFieldIdArr[6] = "tf1_txtWepKey4,"+LANG_LOCALE['12422'];
    
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
    
   if (alphaNumericValueCheck ("tf1_txtProfName", '', '') == false)    
        return false;

   if (isProblemCharArrayCheckSingleParam(txtFieldIdArr) == false)
       return false; 

    if (fieldLengthCheck('tf1_txtSSID', 1, 32, LANG_LOCALE['12920']) == false) 
        return false;
    if (fieldLengthCheck('tf1_txtWPAPasswd', 8, 63, LANG_LOCALE['13426']) == false) 
        return false;
    
    if (wepKeyCheck() == false) {
        return false;
    }

    /* If the radio mode is N only or mixed N (na or ng) mode and security mode is
       WEP/WPA(TKIP) then we should throw error message */
    var hdRadioModeObj = $("#hdRadioMode");
    var hdPurenObj = $("#hdPuren");
    if (hdRadioModeObj && hdPurenObj)
        {
            var radioMode = hdRadioModeObj.val();
            var puren = hdPurenObj.val();
            var securityMode = $("#tf1_selSecurityOpt").val();
            var encryption = $("#tf1_selEncType").val();
            if (securityMode === "WEP" || (securityMode === "WPA" && encryption === "TKIP"))
                {
                    if(radioMode.indexOf('na') != -1 || radioMode.indexOf('ng') != -1)
                        {
                            var mode = "";
                            if(radioMode.indexOf('ng') != -1)
                                mode = "G/N-Mixed";
                            if(radioMode.indexOf('na') != -1)
                                mode = "A/N-Mixed";
                            if(puren == "1")
                                mode = "N only";
                            if(securityMode === "WEP"){
                                var errStr = LANG_LOCALE['50125']+" " + mode + ". " + LANG_LOCALE['50126'];
                            }   
                            else{
                                var errStr = LANG_LOCALE['50127']+" " + mode + ". " + LANG_LOCALE['50128'];
                            }
                            alert(errStr);
			                return false;
		                }
                }
        }

    setHiddenChks(frmId);
    return true;
}

/**
 * Manage WAPKey Fields
 * @method wepKeyCheck
 */
function wepKeyCheck(){
    var selSecObj = document.getElementById("tf1_selSecurityOpt");
    if (selSecObj != null && !selSecObj.disabled) {
        var sec = comboSelectedValueGet("tf1_selSecurityOpt");
        if (sec == "WEP") {
            var wepKeyLength = parseInt(comboSelectedValueGet("tf1_selWepEncrMethod"), 10);
            var asciiLen = 5;
            var hexLen = 10;
            if (wepKeyLength == 64) {
                asciiLen = 5;
                hexLen = 10;
            }
            else {
                asciiLen = 13;
                hexLen = 26;
            }
            for (var i = 1; i <= 4; i++) {
                var wepKey = document.getElementById('tf1_txtWepKey' + i);
                if (wepKey && !wepKey.disabled) {
                    if (wepKey.value.length != asciiLen && wepKey.value.length != hexLen) {
                        alert(LANG_LOCALE['30067'] + " " + asciiLen + " " + LANG_LOCALE['30068'] + " " + hexLen + " " + LANG_LOCALE['30069']);
                        wepKey.focus();
                        return false;
                    }
                    var isAscii = true
                    var isHex = true
                    for (var idx = 0; idx < wepKey.value.length; idx++) {
                        var exceptionChars = '"\''
                        var charCode = wepKey.value.charCodeAt(idx)
                        if (!((charCode >= 97 && charCode <= 122) ||
                        (charCode >= 65 && charCode <= 90) ||
                        (charCode >= 48 && charCode <= 57) ||
                        charCode != exceptionChars.charCodeAt(0) ||
                        charCode != exceptionChars.charCodeAt(1))) {
                            isAscii = false;
                            break;
                        }
                        if (!((charCode >= 97 && charCode <= 102) ||
                        (charCode >= 65 && charCode <= 70) ||
                        (charCode >= 48 && charCode <= 57))) {
                            isHex = false;
                            break;
                        }
                    }
                    if (isAscii && !(isHex) && wepKey.value.length != asciiLen) {
                        alert(LANG_LOCALE['30067'] + " " + asciiLen + " " + LANG_LOCALE['30070']);
                        return false;
                    }
                    if (!isHex && wepKey.value.length == hexLen) {
                        alert(LANG_LOCALE['30067'] + " " + hexLen + " " + LANG_LOCALE['30069']);
                        return false;
                    }
                }
            }
        }
    }
}
function profileSecurityCheck (){
	var encryptionList = [LANG_LOCALE['13103'], LANG_LOCALE['30057'], "TKIP+CCMP"];
	var selectedValue = comboSelectedValueGet  ('tf1_selSecurityOpt');
	if (!selectedValue) return;
	switch (selectedValue){
		case 'WPA+WPA2':
			fieldStateChangeWr ('tf1_enablePreAuth','tf1_tblWEP_div','tf1_selEncType tf1_selAuthType tf1_txtWPAPasswd tf1_enablemfp tf1_forcemfp','');
			vidualDisplay('tf1_enablePreAuth tf1_tblWEP','hide');
			vidualDisplay('break_enablePreAuth break_tblWEP','hide');
			
			vidualDisplay('tf1_selEncType tf1_selAuthType tf1_txtWPAPasswd tf1_enablemfp','configRow');
			vidualDisplay('break_selEncType break_selAuthType break_txtWPAPasswd break_enablemfp','break');
			break;
		case 'WPA2':
			fieldStateChangeWr ('tf1_enablePreAuth','tf1_tblWEP_div','tf1_selEncType tf1_selAuthType tf1_txtWPAPasswd tf1_enablemfp tf1_forcemfp','');
			vidualDisplay('tf1_enablePreAuth tf1_tblWEP','hide');
			vidualDisplay('break_enablePreAuth break_tblWEP','hide');
			
			vidualDisplay('tf1_selEncType tf1_selAuthType tf1_txtWPAPasswd tf1_enablemfp','configRow');
			vidualDisplay('break_selEncType break_selAuthType break_txtWPAPasswd break_enablemfp','break');
            var selectedAuth = comboSelectedValueGet  ('tf1_selAuthType');
            if (selectedAuth == 'RADIUS'){
                fieldStateChangeWr ('','','tf1_enablePreAuth', '');
                vidualDisplay('tf1_enablePreAuth','configRow');
				vidualDisplay('break_enablePreAuth','break');
            }
			break;
		case 'WPA':
			fieldStateChangeWr ('tf1_enablePreAuth','tf1_tblWEP_div','tf1_selEncType tf1_selAuthType tf1_txtWPAPasswd tf1_enablemfp tf1_forcemfp','');
			vidualDisplay('tf1_enablePreAuth tf1_tblWEP','hide');
			vidualDisplay('break_enablePreAuth break_tblWEP','hide');
			
			vidualDisplay('tf1_selEncType tf1_selAuthType tf1_txtWPAPasswd tf1_enablemfp','configRow');
			vidualDisplay('break_selEncType break_selAuthType break_txtWPAPasswd break_enablemfp','break');
			break;
		case 'WEP':
			fieldStateChangeWr ('tf1_selEncType tf1_selAuthType tf1_txtWPAPasswd tf1_enablePreAuth tf1_enablemfp tf1_forcemfp','','','tf1_tblWEP_div');
			vidualDisplay('tf1_selEncType tf1_selAuthType tf1_txtWPAPasswd tf1_enablePreAuth tf1_enablemfp tf1_forcemfp','hide');
			vidualDisplay('break_selEncType break_selAuthType break_txtWPAPasswd break_enablePreAuth break_forcemfp break_enablemfp','hide');
			
			vidualDisplay('tf1_tblWEP','configRow');
			wepKeyIdCheck ();
			break;
		default:
			fieldStateChangeWr ('tf1_selEncType tf1_selAuthType tf1_txtWPAPasswd tf1_enablePreAuth tf1_enablemfp tf1_forcemfp','tf1_tblWEP_div','','');
			vidualDisplay('tf1_selEncType tf1_selAuthType tf1_txtWPAPasswd tf1_enablePreAuth tf1_tblWEP tf1_enablemfp tf1_forcemfp','hide');
			vidualDisplay('break_selEncType break_selAuthType break_txtWPAPasswd break_enablePreAuth break_tblWEP break_forcemfp break_enablemfp','hide');
			break;
		}
		AuthTypeCheck ();
		var chObj = document.getElementById ('tf1_selEncType');
	    if (chObj && !chObj.disabled){
			opIdx = 0;
	        if(selectedValue == 'WPA2'){
		         chObj.options[0] = null;
		         chObj.options[0] = new Option (encryptionList[1], 'CCMP', false, false);
		         /* free remaining options */
		         var len = chObj.options.length;
		         for (delIdx = 1; opIdx < len; ++opIdx)
	                 chObj.options[delIdx] = null;
	              /* security mode options change for wifi logo certification starts */
                    // chObj.options[1] = new Option (encryptionList[2],'TKIP+CCMP', false, false);
                  /* security mode options change for wifi logo certification ends */
			}else if(selectedValue == 'WPA+WPA2'){
			         chObj.options[0] = null;
			         chObj.options[0] = new Option (encryptionList[2], 'TKIP+CCMP', false, false);
			         /* free remaining options */
			         var len = chObj.options.length;
			         for (delIdx = 1; opIdx < len; ++opIdx)
			             chObj.options[delIdx] = null;
			}else{
			     chObj.options[0] = null;
                 chObj.options[0] = new Option (encryptionList[0], 'TKIP', false, false);
				/* free remaining options */
			     var len = chObj.options.length;
			     for (delIdx = 1; opIdx < len; ++opIdx)
			     	chObj.options[delIdx] = null;
                 chObj.options[1] = new Option (encryptionList[2],'TKIP+CCMP', false, false);
			}
	 	}
	}
function AuthTypeCheck ()
	{
	var selectedValue = comboSelectedValueGet  ('tf1_selAuthType');
	if (!selectedValue) return;
	switch (selectedValue)
		{
		case 'PSK+RADIUS':
			fieldStateChangeWr ('tf1_enablePreAuth','','tf1_txtWPAPasswd tf1_enablemfp tf1_forcemfp','');
			vidualDisplay('tf1_enablePreAuth','hide');
			vidualDisplay('break_enablePreAuth','hide');
			
			vidualDisplay('tf1_txtWPAPasswd tf1_enablemfp','configRow');
			vidualDisplay('break_txtWPAPasswd break_enablemfp','break');
            enableTextFieldByAnchorClick('tf1_enablemfp','tf1_forcemfp','break_forcemfp');
			break;
		case 'RADIUS':
			fieldStateChangeWr ('tf1_txtWPAPasswd tf1_enablePreAuth tf1_enablemfp tf1_forcemfp','','','');
			vidualDisplay('tf1_txtWPAPasswd tf1_enablePreAuth tf1_enablemfp tf1_forcemfp','hide');
			vidualDisplay('break_txtWPAPasswd break_enablePreAuth break_enablemfp break_forcemfp','hide');

            var selectedSec = comboSelectedValueGet  ('tf1_selSecurityOpt');
            if (selectedSec == 'WPA2'){
                fieldStateChangeWr ('','','tf1_enablePreAuth','');
                vidualDisplay('tf1_enablePreAuth','configRow');
				vidualDisplay('break_enablePreAuth','break');
            }
			break;
		default:
			fieldStateChangeWr ('tf1_enablePreAuth','','tf1_txtWPAPasswd tf1_enablemfp tf1_forcemfp','');
			vidualDisplay('tf1_enablePreAuth','hide');
			vidualDisplay('break_enablePreAuth','hide');
			
			vidualDisplay('tf1_txtWPAPasswd tf1_enablemfp','configRow');
			vidualDisplay('break_txtWPAPasswd break_enablemfp','break');
            enableTextFieldByAnchorClick('tf1_enablemfp','tf1_forcemfp','break_forcemfp');
			break;
		}
	}
function wepKeyIdCheck ()
	{
		var wepKeyId = parseInt (radioCheckedValueGet ('tf1_rdbWepKey1'), 10);
		switch (wepKeyId)
		{
		case 0:
			fieldStateChangeWr ('tf1_txtWepKey2 tf1_txtWepKey3 tf1_txtWepKey4', '', 'tf1_txtWepKey1', '');
			txtFieldDisplay('tf1_txtWepKey1','show');
			txtFieldDisplay('tf1_txtWepKey2 tf1_txtWepKey3 tf1_txtWepKey4','hide');
		break;
		case 1:
			fieldStateChangeWr ('tf1_txtWepKey1 tf1_txtWepKey3 tf1_txtWepKey4', '', 'tf1_txtWepKey2', '');
			txtFieldDisplay('tf1_txtWepKey2','show');
			txtFieldDisplay('tf1_txtWepKey1 tf1_txtWepKey3 tf1_txtWepKey4','hide');
		break;
		case 2:
			fieldStateChangeWr ('tf1_txtWepKey2 tf1_txtWepKey1 tf1_txtWepKey4', '', 'tf1_txtWepKey3', '');
			txtFieldDisplay('tf1_txtWepKey3','show');
			txtFieldDisplay('tf1_txtWepKey2 tf1_txtWepKey1 tf1_txtWepKey4','hide');
		break;
		case 3:
			fieldStateChangeWr ('tf1_txtWepKey2 tf1_txtWepKey3 tf1_txtWepKey1', '', 'tf1_txtWepKey4', '');
			txtFieldDisplay('tf1_txtWepKey4','show');
			txtFieldDisplay('tf1_txtWepKey2 tf1_txtWepKey3 tf1_txtWepKey1','hide');
		break;
		default:
			document.getElementById ('tf1_rdbWepKey1').checked = true;
			fieldStateChangeWr ('tf1_txtWepKey2 tf1_txtWepKey3 tf1_txtWepKey4', '', 'tf1_txtWepKey1', '');
			txtFieldDisplay('tf1_txtWepKey1','show');
			txtFieldDisplay('tf1_txtWepKey2 tf1_txtWepKey3 tf1_txtWepKey4','hide');
		break;
		}
	}

// text fields should be displaying when select respective radio button
function txtFieldDisplay (fieldList, clsName) {
        if (fieldList && fieldList != "") {
            var fieldsArr = fieldList.split (" ");
            if (!fieldsArr || fieldsArr.length == 0)
                return;
	    for (var idx = 0; idx < fieldsArr.length; idx++) {
	        var fieldObj = document.getElementById (fieldsArr[idx]);
		if (fieldObj)
		    fieldObj.className = clsName;
	    }
        }
    }

function wepKeyLenGet ()
	{
	var encrMethod = comboSelectedValueGet ('tf1_selWepEncrMethod');
	var keyLen = 0;
	switch (parseInt (encrMethod, 10))
		{
		case 152:	/* 152 bit */
			keyLen = 32; /* 32 hex chars */
			break;
		case 128:	/* 126 bit */
			keyLen = 26; /* 26 hex chars */
			break;
		case 64:	/* 64 bit */
		default:
			keyLen = 10; /* 10 hex chars */
		}
	return keyLen;
	}


function wepKeyLenSet ()
	{
	var keyLen = wepKeyLenGet ();
	var wepKeyObj = null;
    	for (idx = 1; idx <= 4; ++idx)
		{
        wepKeyObj = document.getElementById ('tf1_txtWepKey'+idx);
        if (wepKeyObj)
        	{
        	wepKeyObj.maxLength = keyLen;
        	if (wepKeyObj.value.length > keyLen)
        		wepKeyObj.value = wepKeyObj.value.substr (0, keyLen);
        	}
        }
    pass = document.getElementById('tf1_txtWepPsk')
    if ( pass.value != "" )
    	{
    	generateWepKeys ();
    	}
	}
function generateWepKeys (){
	var keyLen = wepKeyLenGet ();
	var wepPsk = document.getElementById ('tf1_txtWepPsk').value;
	if ( wepPsk == "" )
		{
		alert(LANG_LOCALE['30071']);
		return false; 
		}
	document.getElementById ('tf1_txtWepKey1').value = hex_md5 (wepPsk).substr (0, keyLen);
	wepPsk += document.getElementById ('tf1_txtWepKey1').value;
	document.getElementById ('tf1_txtWepKey2').value = hex_md5 (wepPsk).substr (0, keyLen);
	wepPsk += document.getElementById ('tf1_txtWepKey2').value;
	document.getElementById ('tf1_txtWepKey3').value = hex_md5 (wepPsk).substr (0, keyLen);
	wepPsk += document.getElementById ('tf1_txtWepKey3').value;
	document.getElementById ('tf1_txtWepKey4').value = hex_md5 (wepPsk).substr (0, keyLen);
	wepPsk += document.getElementById ('tf1_txtWepKey4').value;
	}	

