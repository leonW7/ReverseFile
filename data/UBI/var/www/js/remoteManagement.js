/*
 * File: remoteManagement.js
 * Created on 21st nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
$(document).ready(function(){
    /**
     * This function calls when user clicks on Checkbox images
     * OnClick validation
     * @method onloadCall
     */
    onloadCall(remoteManagementOnload, {
        imageId: 'tf1_enableRemoteManagement',
        disableIndividual: 'tf1_txtPort tf1_accessType tf1_txtRemoteFromAddr tf1_txtRemoteToAddr tf1_txtOnlyThisPC tf1_accessControl',
        disableGrp: '',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: 'break2 break5 break6 break7',
        breakClass: 'break',
        imagesInfo: {
            disableImages: '',
            enableImages: '',
            disableClass: '',
            enableClass: ''
        }
    });
    
    /**
     * This function calls when page loads
     * OnLoad validation
     */
    remoteManagementOnload({
        imageId: 'tf1_enableRemoteManagement',
        disableIndividual: 'tf1_txtPort tf1_accessType tf1_txtRemoteFromAddr tf1_txtRemoteToAddr tf1_txtOnlyThisPC tf1_accessControl',
        disableGrp: '',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: 'break2 break5 break6 break7',
        breakClass: 'break',
        imagesInfo: {
            disableImages: '',
            enableImages: '',
            disableClass: '',
            enableClass: ''
        }
    })
});

function remoteOnreset() {
 remoteManagementOnload({
        imageId: 'tf1_enableRemoteManagement',
        disableIndividual: 'tf1_txtPort tf1_accessType tf1_txtRemoteFromAddr tf1_txtRemoteToAddr tf1_txtOnlyThisPC tf1_accessControl',
        disableGrp: '',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: 'break2 break5 break6 break7',
        breakClass: 'break',
        imagesInfo: {
            disableImages: '',
            enableImages: '',
            disableClass: '',
            enableClass: ''
        }
    })

}

/**
 * function for toggle the image
 * @method remoteManagementOnload
 * @param toggleObj - object
 */
function remoteManagementOnload(toggleObj){
   
   onAnchorToggle(toggleObj);
   var imgObj = document.getElementById('tf1_enableRemoteManagement').className;
   var imageName = imgObj.substring(imgObj.lastIndexOf('/') + 1);
   var highSecObj = document.getElementById('hdHighSec');
   if (highSecObj && highSecObj.value == "HIGH")
       {
           var imgObj2 = document.getElementById('tf1_SSH').className;
           var imageName2 = imgObj2.substring(imgObj2.lastIndexOf('/') + 1);
       }

   if (imageName == ON_ANCHOR || imageName2 == ON_ANCHOR)
       {
      fieldStateChangeWr('', '', 'tf1_accessType1 tf1_accessType2 tf1_accessType3', '');
           vidualDisplay('tf1_accessControl tf1_accessType', 'configRow');
           vidualDisplay('break5', 'break');
       accessTypeChange('tf1_accessType1');
       }
   else
       {
       fieldStateChangeWr('tf1_accessType1 tf1_accessType2 tf1_accessType3', '', '', '');
           vidualDisplay('tf1_accessControl tf1_accessType', 'hide');
           vidualDisplay('break5', 'hide')
       }
}
 
/**
 * This function calls when user clicks on submit button
 * On submit validation
 * @method remoteMgmtValidation
 */
function remoteMgmtValidation(){
    var txtValidArray = new Array();
    txtValidArray[0] = "tf1_txtPort,"+LANG_LOCALE['12082'];
    txtValidArray[1] = "tf1_txtRemoteFromAddr,"+LANG_LOCALE['12015'];
    txtValidArray[2] = "tf1_txtRemoteToAddr,"+LANG_LOCALE['12139'];
    txtValidArray[3] = "tf1_txtOnlyThisPC,"+LANG_LOCALE['12114'];
    
    if (txtFieldArrayCheck(txtValidArray) == false) 
        return false;

    if (isProblemCharArrayCheck(txtValidArray, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    if (ipv4Validate("tf1_txtRemoteFromAddr", "IP", false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
    
    if (ipv4Validate("tf1_txtRemoteToAddr", "IP", false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
        
    if(checkIPAddrRange("tf1_txtRemoteFromAddr", "tf1_txtRemoteToAddr")==false)
        return false;  
    
    if (ipv4Validate("tf1_txtOnlyThisPC", "IP", false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;

    var portObj = document.getElementById('tf1_txtPort');
    if (portObj.value && !portObj.disabled) {
    	if (numericValueRangeCheck(portObj, '', '', 1, 65535, true, LANG_LOCALE['11315']+': ', '') == false)
		{ 
            return false;
	 	}

		if((portObj.value>=1) && (portObj.value<=1024)) {
			return confirm(LANG_LOCALE['30346']);
		}

    }
 
    return true;
}
/**
* This function calls to check ip address range
* @method checkIPAddrRange
*/
function checkIPAddrRange(startIP, endIP){
	var startIpObj=document.getElementById (startIP);
	var endIpObj=document.getElementById (endIP);

	if(startIpObj && !startIpObj.disabled && endIpObj && !endIpObj.disabled){
		var dhcpStart = getIPInt1(startIP)
		var dhcpEnd = getIPInt1(endIP);
		if (compareIP(dhcpStart, dhcpEnd) > 0){
			alert (LANG_LOCALE['10935']);
			document.getElementById(startIP).focus ();
			return false;
		}
	}else{
		return true;
	}
}
/**
 * function for changing the mode settings of radio buttons
 * Onclick event
 * @method accessTypeChange
 * @param radioName - Radio button name
 */
function accessTypeChange(radioName){
    var selValue = radioCheckedValueGet(radioName);
    if (!selValue) 
        return;
    switch (parseInt(selValue, 10)) {
        case 1: /* All IP Addresses */
            fieldStateChangeWr('tf1_txtRemoteFromAddr tf1_txtRemoteToAddr tf1_txtOnlyThisPC', '', 'tf1_txtVlan', '');
            vidualDisplay('tf1_txtRemoteFromAddr tf1_txtRemoteToAddr tf1_txtOnlyThisPC', 'hide');
            vidualDisplay('break5 break6 break7', 'hide');
            break;
            
        case 2: /* IP Address Range */
            fieldStateChangeWr('tf1_txtOnlyThisPC', '', 'tf1_txtRemoteFromAddr tf1_txtRemoteToAddr', '');
            vidualDisplay('tf1_txtOnlyThisPC', 'hide');
            vidualDisplay('break7', 'hide');
            
            vidualDisplay('tf1_txtRemoteFromAddr tf1_txtRemoteToAddr', 'configRow');
            vidualDisplay('break5 break6', 'break');
            break;
        case 3: /* Only Selected PC */
            fieldStateChangeWr('tf1_txtRemoteFromAddr tf1_txtRemoteToAddr', '', 'tf1_txtOnlyThisPC', '');
            vidualDisplay('tf1_txtRemoteFromAddr tf1_txtRemoteToAddr', 'hide');
            vidualDisplay('break5 break6', 'hide');
            
            vidualDisplay('tf1_txtOnlyThisPC', 'configRow');
            vidualDisplay('break7', 'break');
            break;
            
    }
}



