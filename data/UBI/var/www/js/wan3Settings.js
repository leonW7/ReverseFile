/*
 * File: wan3Settings.js
 * Created on 11th April 2014 - Ramakrishna Reddy
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
 

/**
 * Onload Call
*/ 
$(document).ready(function(){
	onloadCall(wan3SettingsOnload, {
        imageId: '',
        disableIndividual: '',
        disableGrp: '',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: '',
        imagesInfo: {
            disableImages: '',
            enableImages: '',
            disableClass: '',
            enableClass: ''
        }
    });
	changeReconnectModeType('tf1_reconnectModeOnDemand');
	changeDNSServerSource('tf1_dnsServerSrc');
	portSetupChangeMode('dynamicPortSetup','','tf1_dynamicCustomMTU1');
	enableTextFieldByAnchorClick('tf1_APN3GRequired','tf1_APN3G','break_APN3G');
	
});

/**
 * Onload function
 * @method optionSetupOnload
 * @param toggleObj - object
 */
function wan3SettingsOnload(toggleObj,thisObject){
    onAnchorToggle(toggleObj);
    var imgId = thisObject.id;
   	if (imgId == "tf1_APN3GRequired" ) {
	enableTextFieldByAnchorClick('tf1_APN3GRequired','tf1_APN3G','break_APN3G');
	}
     
}

/**
 * OnReset Call
*/ 
function wan3SettingsOnReset(frmId){
	resetImgOnOff(frmId);
	changeReconnectModeType('tf1_reconnectModeOnDemand');
	changeDNSServerSource('tf1_dnsServerSrc');
	portSetupChangeMode('dynamicPortSetup','','tf1_dynamicCustomMTU1');
	enableTextFieldByAnchorClick('tf1_APN3GRequired','tf1_APN3G','break_APN3G');
    portSetupChangeMode('dynamicPortSetup','tf1_dynamicCustomMTU1','');
	
}

/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method wan3SettingsValidate
 */
function wan3SettingsValidate(){

    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_maxIdleTime, "+LANG_LOCALE['12053'];
    txtFieldIdArr[1] = "tf1_dailInNumber, "+LANG_LOCALE['12256'];
    txtFieldIdArr[2] = "tf1_APN3G, "+LANG_LOCALE['12217'];      
    txtFieldIdArr[3] = "tf1_primaryDNSServer, "+LANG_LOCALE['12091'];
    txtFieldIdArr[4] = "tf1_secondaryDNSServer, "+LANG_LOCALE['12108'];
        
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;            
     
	var obj = document.getElementById('tf1_maxIdleTime');
	if (numericValueRangeCheck(obj, '', '', 1, 999, true, LANG_LOCALE['11301']+': ', '') == false) 
        return false;
        
     if (ipv4Validate('tf1_primaryDNSServer', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;  
        
    if (ipv4Validate('tf1_secondaryDNSServer', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
    setHiddenChks('tf1_frmWan3Settings');
	return true;    
}

/****
 * This function calls when user selects an radio option
 * OnClick event
 * @method changeReconnectModeType
 * @param radioName - radio button Name
 */
function changeReconnectModeType(radioName){

	var selValue = radioCheckedValueGet(radioName);
	if (!selValue) return;	
    switch (parseInt(selValue, 10)){
	    case 1:	/* Always On */
	    	fieldStateChangeWr('tf1_maxIdleTime','','','');	    	
	    	vidualDisplay('tf1_maxIdleTime','hide');	 	    	   	
			vidualDisplay('break_maxIdleTime','hide');	
	    break;
	    case 2: /* On Demand */	    	    	
		   	fieldStateChangeWr('','','tf1_maxIdleTime','');	    	
	    	vidualDisplay('tf1_maxIdleTime','configRow');	    	  	
			vidualDisplay('break_maxIdleTime','break');	    
		break;	   
    }
}

/****
 * This function calls when user selects an radio option
 * OnClick event
 * @method changeDNSServerSource
 * @param selName - Selectbox Name
 */
function changeDNSServerSource(radioName){

	var selValue = radioCheckedValueGet(radioName);
	if (!selValue) return;	
    switch (parseInt(selValue, 10)){
	    case 1:	/* Get Dynamically from ISP */
	    	fieldStateChangeWr('tf1_primaryDNSServer tf1_secondaryDNSServer','','','');	    	
	    	vidualDisplay('tf1_primaryDNSServer tf1_secondaryDNSServer','hide');	 	    	   	
			vidualDisplay('break_primaryDNSServer break_secondaryDNSServer','hide');	
	    break;
	    case 2: /* Use These DNS Servers */	    	    	
		   	fieldStateChangeWr('','','tf1_primaryDNSServer tf1_secondaryDNSServer','');	    	
	    	vidualDisplay('tf1_primaryDNSServer tf1_secondaryDNSServer','configRow');	    	  	
			vidualDisplay('break_primaryDNSServer break_secondaryDNSServer','break');	    
		break;	   
    }
}

/**
 * This function calls when User select an radio option
 * @method portSetupChangeMode
 * @param radioName - Radio Button value
 * @param enableFld - Fields to be enabled
 * @param disableFld - Fields to be disabled
 */
function portSetupChangeMode(radioName, enableFld, disableFld){
    var selValue = radioCheckedValueGet(radioName);
    if (!selValue) 
        return;
    switch (parseInt(selValue, 10)) {
        case 1: /* Default */
            fieldStateChangeWr(disableFld, '', '')
            vidualDisplay(disableFld, 'hide');
            break;
        case 2: /* Custom */
            fieldStateChangeWr('', '', enableFld);
            vidualDisplay(enableFld, 'configRow');
            break;
    }
}
