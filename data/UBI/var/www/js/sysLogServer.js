/*
 * File: sysLog.js
 * Created on 8th Feb 2013 - Lakshmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
 
var domainNameExt = new Array('.com', '.net', '.aero', '.asia', '.cat', '.jobs', '.org', '.biz', '.coop', '.info', '.museum', '.name', '.pro', '.tel', '.travel', '.edu', '.gov', '.int', '.mil', '.mobi', '.ac', '.ad', '.ae', '.af', '.ag', '.ai', '.al', '.am', '.an', '.ao', '.aq', '.ar', '.as', '.at', '.au', '.aw', '.ax', '.az', '.ba', '.bb', '.bd', '.be', '.bf', '.bg', '.bh', '.bi', '.bj', '.bm', '.bn', '.bo', '.br', '.bs', '.bt', '.bv', '.bw', '.by', '.bz', '.ca', '.cc', '.cd', '.cf', '.cg', '.ch', '.ci', '.ck', '.cl', '.cm', '.cn', '.co', '.cr', '.cu', '.cv', '.cx', '.cy', '.cz', '.de', '.dj', '.dk', '.dm', '.do', '.dz', '.ec', '.ee', '.eg', '.er', '.es', '.et', '.eu', '.fi', '.fj', '.fk', '.fm', '.fo', '.fr', '.ga', '.gb', '.gd', '.ge', '.gf', '.gg', '.gh', '.gi', '.gl', '.gm', '.gn', '.gp', '.gq', '.gr', '.gs', '.gt', '.gu', '.gw', '.gy', '.hk', '.hm', '.hn', '.hr', '.ht', '.hu', '.id', '.ie', '.il', '.im', '.in', '.io', '.iq', '.ir', '.is', '.it', '.je', '.jm', '.jo', '.jp', '.ke', '.kg', '.kh', '.ki', '.km', '.kn', '.kp', '.kr', '.kw', '.ky', '.kz', '.la', '.lb', '.lc', '.li', '.lk', '.lr', '.ls', '.lt', '.lu', '.lv', '.ly', '.ma', '.mc', '.md', '.me', '.mg', '.mh', '.mk', '.ml', '.mm', '.mn', '.mo', '.mp', '.mq', '.mr', '.ms', '.mt', '.mu', '.mv', '.mw', '.mx', '.my', '.mz', '.na', '.nc', '.ne', '.nf', '.ng', '.ni', '.nl', '.no', '.np', '.nr', '.nu', '.nz', '.om', '.pa', '.pe', '.pf', '.pg', '.ph', '.pk', '.pl', '.pm', '.pn', '.pr', '.ps', '.pt', '.pw', '.py', '.qa', '.re', '.ro', '.rw', '.ru', '.sa', '.sb', '.sc', '.sd', '.se', '.sg', '.sh', '.si', '.sj', '.sk', '.sl', '.sm', '.sn', '.so', '.sr', '.st', '.sv', '.sy', '.sz', '.tc', '.td', '.tf', '.tg', '.th', '.tj', '.tk', '.tm', '.tn', '.to', '.tp', '.tr', '.tt', '.tv', '.tw', '.tz', '.ua', '.ug', '.uk', '.um', '.us', '.uy', '.uz', '.va', '.vc', '.ve', '.vg', '.vi', '.vn', '.vu', '.ws', '.wf', '.ye', '.yt', '.yu', '.za', '.zm', '.zw');

/**
 * Onload Call
*/ 
jQuery(function(){
    onloadCall(sysLogConfigOnload, {imageId: '', disableIndividual: '', disableGrp: '', enableIndividual: '', enableGrp: '', hideClass: 'hide', showClass: 'configRow', breakDivs: 'break_dhcpAddressConfigMode break_dhcpEnablePrefixDelegation', breakClass: 'break', imagesInfo: {disableImages: '', enableImages: '', disableClass: '', enableClass: ''}});
    
    enableTextFieldByAnchorClick('tf1_enableSysLogServer1','tf1_sysLogName1 tf1_sysLogFacility1 tf1_sysLogSeverity1','break_sysLogName1 break_sysLogFacility1 break_sysLogSeverity1');
    
    enableTextFieldByAnchorClick('tf1_enableSysLogServer2','tf1_sysLogName2 tf1_sysLogFacility2 tf1_sysLogSeverity2','break_sysLogName2 break_sysLogFacility2 break_sysLogSeverity2');

	enableTextFieldByAnchorClick('tf1_enableSysLogServer3','tf1_sysLogName3 tf1_sysLogFacility3 tf1_sysLogSeverity3','break_sysLogName3 break_sysLogFacility3 break_sysLogSeverity3');
	
	enableTextFieldByAnchorClick('tf1_enableSysLogServer4','tf1_sysLogName4 tf1_sysLogFacility4 tf1_sysLogSeverity4','break_sysLogName4 break_sysLogFacility4 break_sysLogSeverity4');
	
	enableTextFieldByAnchorClick('tf1_enableSysLogServer5','tf1_sysLogName5 tf1_sysLogFacility5 tf1_sysLogSeverity5','break_sysLogName5 break_sysLogFacility5 break_sysLogSeverity5');
	
	enableTextFieldByAnchorClick('tf1_enableSysLogServer6','tf1_sysLogName6 tf1_sysLogFacility6 tf1_sysLogSeverity6','break_sysLogName6 break_sysLogFacility6 break_sysLogSeverity6');
	
	enableTextFieldByAnchorClick('tf1_enableSysLogServer7','tf1_sysLogName7 tf1_sysLogFacility7 tf1_sysLogSeverity7','break_sysLogName7 break_sysLogFacility7 break_sysLogSeverity7');
	
	enableTextFieldByAnchorClick('tf1_enableSysLogServer8','tf1_sysLogName8 tf1_sysLogFacility8 tf1_sysLogSeverity8','break_sysLogName8 break_sysLogFacility8 break_sysLogSeverity8');
	enableTextFieldByAnchorClick('tf1_enableSysLogServer9','tf1_sysLogName9 tf1_sysLogFacility9 tf1_sysLogSeverity9','break_sysLogName9 break_sysLogFacility9 break_sysLogSeverity9');
	enableTextFieldByAnchorClick('tf1_enableSysLogServer10','tf1_sysLogName10 tf1_sysLogFacility10 tf1_sysLogSeverity10','break_sysLogName10 break_sysLogFacility10 break_sysLogSeverity10');

});

function sysLogServerOnreset() {
	enableTextFieldByAnchorClick('tf1_enableSysLogServer1','tf1_sysLogName1 tf1_sysLogFacility1 tf1_sysLogSeverity1','break_sysLogName1 break_sysLogFacility1 break_sysLogSeverity1');
    
    enableTextFieldByAnchorClick('tf1_enableSysLogServer2','tf1_sysLogName2 tf1_sysLogFacility2 tf1_sysLogSeverity2','break_sysLogName2 break_sysLogFacility2 break_sysLogSeverity2');

	enableTextFieldByAnchorClick('tf1_enableSysLogServer3','tf1_sysLogName3 tf1_sysLogFacility3 tf1_sysLogSeverity3','break_sysLogName3 break_sysLogFacility3 break_sysLogSeverity3');
	
	enableTextFieldByAnchorClick('tf1_enableSysLogServer4','tf1_sysLogName4 tf1_sysLogFacility4 tf1_sysLogSeverity4','break_sysLogName4 break_sysLogFacility4 break_sysLogSeverity4');
	
	enableTextFieldByAnchorClick('tf1_enableSysLogServer5','tf1_sysLogName5 tf1_sysLogFacility5 tf1_sysLogSeverity5','break_sysLogName5 break_sysLogFacility5 break_sysLogSeverity5');
	
	enableTextFieldByAnchorClick('tf1_enableSysLogServer6','tf1_sysLogName6 tf1_sysLogFacility6 tf1_sysLogSeverity6','break_sysLogName6 break_sysLogFacility6 break_sysLogSeverity6');
	
	enableTextFieldByAnchorClick('tf1_enableSysLogServer7','tf1_sysLogName7 tf1_sysLogFacility7 tf1_sysLogSeverity7','break_sysLogName7 break_sysLogFacility7 break_sysLogSeverity7');
	
	enableTextFieldByAnchorClick('tf1_enableSysLogServer8','tf1_sysLogName8 tf1_sysLogFacility8 tf1_sysLogSeverity8','break_sysLogName8 break_sysLogFacility8 break_sysLogSeverity8');
	enableTextFieldByAnchorClick('tf1_enableSysLogServer9','tf1_sysLogName9 tf1_sysLogFacility9 tf1_sysLogSeverity9','break_sysLogName9 break_sysLogFacility9 break_sysLogSeverity9');
	enableTextFieldByAnchorClick('tf1_enableSysLogServer10','tf1_sysLogName10 tf1_sysLogFacility10 tf1_sysLogSeverity10','break_sysLogName10 break_sysLogFacility10 break_sysLogSeverity10');
}


/**
 * Wrapper function called onload
 * @method changeAutoRange
 * @param obj
 */
function sysLogConfigOnload(toggleObj, thisObj){
    onAnchorToggle(toggleObj);
    var imgId=thisObj.id;
    
    switch(imgId){
    	case 'tf1_enableSysLogServer1':    		
    		enableTextFieldByAnchorClick('tf1_enableSysLogServer1','tf1_sysLogName1 tf1_sysLogFacility1 tf1_sysLogSeverity1','break_sysLogName1 break_sysLogFacility1 break_sysLogSeverity1');
    	break; 
    	case 'tf1_enableSysLogServer2':    		
    		enableTextFieldByAnchorClick('tf1_enableSysLogServer2','tf1_sysLogName2 tf1_sysLogFacility2 tf1_sysLogSeverity2','break_sysLogName2 break_sysLogFacility2 break_sysLogSeverity2');
    	break; 
    	case 'tf1_enableSysLogServer3':    		
    		enableTextFieldByAnchorClick('tf1_enableSysLogServer3','tf1_sysLogName3 tf1_sysLogFacility3 tf1_sysLogSeverity3','break_sysLogName3 break_sysLogFacility3 break_sysLogSeverity3');				
    	break;
    	case 'tf1_enableSysLogServer4':    		
    		enableTextFieldByAnchorClick('tf1_enableSysLogServer4','tf1_sysLogName4 tf1_sysLogFacility4 tf1_sysLogSeverity4','break_sysLogName4 break_sysLogFacility4 break_sysLogSeverity4');			
    	break;
    	case 'tf1_enableSysLogServer5':    		
    		enableTextFieldByAnchorClick('tf1_enableSysLogServer5','tf1_sysLogName5 tf1_sysLogFacility5 tf1_sysLogSeverity5','break_sysLogName5 break_sysLogFacility5 break_sysLogSeverity5');				
    	break;
    	case 'tf1_enableSysLogServer6':    		
    		enableTextFieldByAnchorClick('tf1_enableSysLogServer6','tf1_sysLogName6 tf1_sysLogFacility6 tf1_sysLogSeverity6','break_sysLogName6 break_sysLogFacility6 break_sysLogSeverity6');				
    	break;
    	case 'tf1_enableSysLogServer7':    		
    		enableTextFieldByAnchorClick('tf1_enableSysLogServer7','tf1_sysLogName7 tf1_sysLogFacility7 tf1_sysLogSeverity7','break_sysLogName7 break_sysLogFacility7 break_sysLogSeverity7');				
    	break;
    	case 'tf1_enableSysLogServer8':    		
    		enableTextFieldByAnchorClick('tf1_enableSysLogServer8','tf1_sysLogName8 tf1_sysLogFacility8 tf1_sysLogSeverity8','break_sysLogName8 break_sysLogFacility8 break_sysLogSeverity8');			
    	break;   	
    	case 'tf1_enableSysLogServer9':    		
	        enableTextFieldByAnchorClick('tf1_enableSysLogServer9','tf1_sysLogName9 tf1_sysLogFacility9 tf1_sysLogSeverity9','break_sysLogName9 break_sysLogFacility9 break_sysLogSeverity9');
    	break;   	
    	case 'tf1_enableSysLogServer10':    		
            enableTextFieldByAnchorClick('tf1_enableSysLogServer10','tf1_sysLogName10 tf1_sysLogFacility10 tf1_sysLogSeverity10','break_sysLogName10 break_sysLogFacility10 break_sysLogSeverity10');
    	break;   	
    }
}

/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method advancedRadioValidate
 */
function sysLogConfigValidate(frmId){

    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_sysLogName1,"+LANG_LOCALE['12405'];
    txtFieldIdArr[1] = "tf1_sysLogName2,"+LANG_LOCALE['12405'];
    txtFieldIdArr[2] = "tf1_sysLogName3,"+LANG_LOCALE['12405'];
    txtFieldIdArr[3] = "tf1_sysLogName4,"+LANG_LOCALE['12405'];
    txtFieldIdArr[4] = "tf1_sysLogName5,"+LANG_LOCALE['12405'];
    txtFieldIdArr[5] = "tf1_sysLogName6,"+LANG_LOCALE['12405'];
    txtFieldIdArr[6] = "tf1_sysLogName7,"+LANG_LOCALE['12405'];
    txtFieldIdArr[7] = "tf1_sysLogName8,"+LANG_LOCALE['12405'];
    txtFieldIdArr[8] = "tf1_sysLogName9,"+LANG_LOCALE['12405'];
    txtFieldIdArr[9] = "tf1_sysLogName10,"+LANG_LOCALE['12405'];

	if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;  

    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;   
    
	var sysObj1 = document.getElementById('tf1_sysLogName1');
	if (sysObj1 && !sysObj1.disabled) {
    	if(ipaddrValidate('tf1_sysLogName1') == false || validateFQDN('tf1_sysLogName1') == false)
    		return false;
    }
    
    var sysObj2 = document.getElementById('tf1_sysLogName2');
	if (sysObj2 && !sysObj2.disabled) {
    	if(ipaddrValidate('tf1_sysLogName2') == false || validateFQDN('tf1_sysLogName2') == false)
    		return false;
    }
    
    var sysObj3 = document.getElementById('tf1_sysLogName3');
	if (sysObj3 && !sysObj3.disabled) {
    	if(ipaddrValidate('tf1_sysLogName3') == false || validateFQDN('tf1_sysLogName3') == false)
    		return false;
    }
    
    var sysObj4 = document.getElementById('tf1_sysLogName4');
	if (sysObj4 && !sysObj4.disabled) {
    	if(ipaddrValidate('tf1_sysLogName4') == false || validateFQDN('tf1_sysLogName4') == false)
    		return false;
    }
    
    var sysObj5 = document.getElementById('tf1_sysLogName5');
	if (sysObj5 && !sysObj5.disabled) {
    	if(ipaddrValidate('tf1_sysLogName5') == false || validateFQDN('tf1_sysLogName5') == false)
    		return false;
    }
    
    var sysObj6 = document.getElementById('tf1_sysLogName6');
	if (sysObj6 && !sysObj6.disabled) {
    	if(ipaddrValidate('tf1_sysLogName6') == false || validateFQDN('tf1_sysLogName6') == false)
    		return false;
    }
    
    var sysObj7 = document.getElementById('tf1_sysLogName7');
	if (sysObj7 && !sysObj7.disabled) {
    	if(ipaddrValidate('tf1_sysLogName7') == false || validateFQDN('tf1_sysLogName7') == false)
    		return false;
    }
    
    var sysObj8 = document.getElementById('tf1_sysLogName8');
	if (sysObj8 && !sysObj8.disabled) {
    	if(ipaddrValidate('tf1_sysLogName8') == false || validateFQDN('tf1_sysLogName8') == false)
    		return false;
    }
    
    var sysObj9 = document.getElementById('tf1_sysLogName9');
	if (sysObj9 && !sysObj9.disabled) {
    	if(ipaddrValidate('tf1_sysLogName9') == false || validateFQDN('tf1_sysLogName9') == false)
    		return false;
    }

    var sysObj10 = document.getElementById('tf1_sysLogName10');
	if (sysObj10 && !sysObj10.disabled) {
    	if(ipaddrValidate('tf1_sysLogName10') == false || validateFQDN('tf1_sysLogName10') == false)
    		return false;
    }

	setHiddenChks(frmId);
    return true;
}

/****
 * This function calls to check the param data is valid domain or Ip or not
 * @method ipaddrValidate
 * @param ipAddr - ipaddress/domain name
 */
function ipaddrValidate(ipAddr){
    var lastOctateVal = 0;
    var ipAddrObj = document.getElementById(ipAddr);
    if (!ipAddrObj || ipAddrObj.disabled) 
        return true;
    var ipAddrObjArr = (ipAddrObj.value).split(".");
    if (ipAddrObjArr.length == 1) {
        alert(LANG_LOCALE['11283']);
        ipAddrObj.focus();
        return false;
    }
    if (ipAddrObjArr.length) 
        lastOctateVal = ipAddrObjArr[ipAddrObjArr.length - 1];
    if (!isNaN(lastOctateVal)) {
        if (ipv4AddrValidate(ipAddrObj, 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) {
            ipAddrObj.focus();
            return false;
        }
    }
    else {
        if (checkDomainExtension(lastOctateVal) == false) {
            alert(LANG_LOCALE['12003']);
            return false;
        }
        if (ipAddrObj.value.length > 253 || ipAddrObj.value.length < 1) {
            alert(LANG_LOCALE['13061']);
            return false;
        }
        if (checkEachNodeLength(ipAddrObjArr) == false) 
            return false;
        
        if (checkHostName(ipAddr, true, LANG_LOCALE['11282']+': ', false) == false) 
            return false;
        return true;
    }
}

/*
 function: checkEachNodeLength
 parameters: Array of nodes in a domain name.
 purpose : Checks is number of characters in a node of a domain exceeds 63 characters.
 return : true or false;
 @param nodeArray - ipaddress/domain name
 */
function checkEachNodeLength(nodeArray){
    for (var i = 0; i <= nodeArray.length - 1; i++) {
        var node = nodeArray[i];
        if (node.length > 63) {
            alert(LANG_LOCALE['10855'])
            return false;
        }
    }
    return true;
}

/*
 function: checkDomainExtension
 parameters: last octate value of domain name.
 purpose : checks if the extension falls in the specified domains.
 return : true or false;
 @param lastOctateVal - extention
 */
function checkDomainExtension(lastOctateVal){
    var ext = "." + lastOctateVal;
    for (var i = 0; i <= domainNameExt.length - 1; i++) {
        if (ext == domainNameExt[i]) 
            return true;
    }
    return false;
}
